import 'package:flutter/material.dart';
import 'gerenciar_clientes.dart';
import 'gerenciar_pedidos.dart';

class DashboardPage extends StatefulWidget {
  DashboardPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int telaIndex = 0;
  Widget telaAtiva;

  final GerenciarClientes _gerenciarClientes = new GerenciarClientes();
  final GerenciarPedidos _gerenciarPedidos = new GerenciarPedidos();

  Widget pageChooser() {
    switch (this.telaIndex) {
      case 0:
        return _gerenciarClientes;
        break;

      case 1:
        return _gerenciarPedidos;
        break;

      default:
        return GridView.count(
          padding: EdgeInsets.all(10),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          children: <Widget>[
            GridItem(Colors.indigo, Icons.person, "Clientes", "Gerenciar clientes", onTap: (){
              telaSelecionada(0);
              //Navigator.pushNamed(context, "/clientes/listar");
            }),
            GridItem(Colors.deepPurple, Icons.folder_special, "Produtos",
                "Catálogo de produtos", onTap: (){
                  telaSelecionada(1);
                  //Navigator.pushNamed(context, "/clientes/listar");
                }),


            GridItem(Colors.red, Icons.receipt, "Pedidos", "Gerenciar pedidos"),
            GridItem(Colors.green, Icons.chat, "Mensagens", "Enviar e receber"),
            GridItem(Colors.amber, Icons.map, "Rotas", "Traçar rota de visita"),
            GridItem(Colors.teal, Icons.picture_as_pdf, "Relatórios",
                "Relatórios e gráficos"),
            GridItem(Colors.lightGreen, Icons.monetization_on, "Lucros e perdas", "Movimentações financeiras"),
            GridItem(Colors.grey, Icons.settings, "Configurações", "Ajustes do sistema"),
          ],
        );
    }
  }

  void telaSelecionada(int index) {
    setState(() {
      this.telaIndex = index;
    });
  }

  Widget GridItem(
      MaterialColor cor, IconData icone, String texto, String detalhes,
      {Function() onTap}) {
    return Material(
        elevation: 14.0,
        borderRadius: BorderRadius.circular(12.0),
        shadowColor: Color(0x802196F3),
        child: InkWell(
          borderRadius: BorderRadius.circular(12.0),
          enableFeedback: true,
          splashColor: Colors.lightBlueAccent,
          onTap: onTap != null
              ? () => onTap()
              : () {
                  final snackBar = SnackBar(
                    content: Text(
                        'Esta funcionalidade ainda não está implementada.'),
                    action: SnackBarAction(
                      label: 'OK',
                      onPressed: () {
                        // Some code to undo the change.
                      },
                    ),
                  );
                  Scaffold.of(context).showSnackBar(snackBar);
                },
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Material(
                      color: cor,
                      shape: CircleBorder(),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Icon(icone, color: Colors.white, size: 30.0),
                      )),
                  Padding(padding: EdgeInsets.only(bottom: 16.0)),
                  Text(texto,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 24.0)),
                  Text(detalhes, style: TextStyle(color: Colors.black45)),
                ]),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return pageChooser();
  }
}
