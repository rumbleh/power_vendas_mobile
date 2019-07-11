import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:cpf_cnpj_validator/cpf_validator.dart';
import 'package:cpf_cnpj_validator/cnpj_validator.dart';

enum kTipoCliente { CPF, CNPJ }

class CadastroCliente extends StatefulWidget {
  int get id => 9;

  @override
  _CadastroClienteState createState() => _CadastroClienteState();
}

class _CadastroClienteState extends State<CadastroCliente> {
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();
  String _tipocliente = "CNPJ";
  FocusNode myFocusNode;

  @override
  void initState() {
    super.initState();
    myFocusNode = FocusNode();
  }

  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    myFocusNode.dispose();
    super.dispose();
  }

  void _onChange(dynamic) => _fbKey.currentState.save();

  bool isCNPJ() {
    return _tipocliente == "CNPJ";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            FormBuilder(
                key: _fbKey,
                autovalidate: true,
                child: Column(
                  children: <Widget>[
                    FormBuilderRadio(
                        decoration: InputDecoration(
                            labelText: 'Tipo de documento do cliente'),
                        attribute: "tipo_documento_cliente",
                        validators: [
                          FormBuilderValidators.required(
                              errorText:
                                  "Informe se o tipo do cliente é CPF ou CNPJ")
                        ],
                        initialValue: "CNPJ",
                        options: [
                          "CNPJ",
                          "CPF",
                        ]
                            .map((lang) => FormBuilderFieldOption(value: lang))
                            .toList(growable: false),
                        onChanged: (value) {
                          _fbKey.currentState.save();
                          setState(() {
                            _tipocliente = value;
                          });
                          FocusScope.of(context).requestFocus(myFocusNode);
                        }),
                    Container(
                      padding: EdgeInsets.only(top: 20, bottom: 0),
                      child: FormBuilderTextField(
                        focusNode: myFocusNode,
                        attribute: "documento_cliente",
                        decoration: InputDecoration(
                          labelText: "Documento",
                        ),
                        style: TextStyle(fontSize: 20),
                        validators: [
                          (val) {
                            if (!(val == null || val.isEmpty)) {
                              switch (_tipocliente) {
                                case "CPF":
                                  if (!CPFValidator.isValid(val))
                                    return "Informe um CPF válido";
                                  break;
                                case "CNPJ":
                                  if (!CNPJValidator.isValid(val))
                                    return "Informe um CNPJ válido";
                                  break;
                                default:
                                  return "Informe um CNPJ válido";
                              }
                            }
                            return "";
                          },
                        ],
                      ),
                    ),
                    _tipocliente == "CNPJ"
                        ? Container(
                            padding: EdgeInsets.only(top: 0, bottom: 10),
                            child: FormBuilderTextField(
                              attribute: "razao_social",
                              decoration: InputDecoration(
                                labelText: "Razão Social",
                              ),
                              style: TextStyle(fontSize: 20),
                              validators: [FormBuilderValidators.min(5)],
                            ),
                          )
                        : Container(),
                    _tipocliente == "CPF"
                        ? Container(
                            padding: EdgeInsets.only(top: 0, bottom: 10),
                            child: FormBuilderTextField(
                              attribute: "nome_pessoa",
                              decoration: InputDecoration(
                                labelText: "Nome completo",
                              ),
                              style: TextStyle(fontSize: 20),
                              validators: [FormBuilderValidators.min(5)],
                            ),
                          )
                        : Container(),
                  ],
                )),
            Row(
              children: <Widget>[
                MaterialButton(
                  child: Text("Submit"),
                  onPressed: () {
                    _fbKey.currentState.save();
                    if (_fbKey.currentState.validate()) {
                      print(_fbKey.currentState.value);
                    }
                  },
                ),
                MaterialButton(
                  child: Text("Reset"),
                  onPressed: () {
                    _fbKey.currentState.reset();
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
