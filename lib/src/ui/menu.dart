import 'package:flutter/material.dart';
import 'package:power_vendas_mobile/src/bloc/navigation_bloc.dart';
import 'package:power_vendas_mobile/src/ui/home.dart';
import 'package:power_vendas_mobile/src/ui/clientes.dart';
import 'package:power_vendas_mobile/src/ui/pedidos.dart';
import 'package:power_vendas_mobile/src/ui/produtos.dart';
import 'package:power_vendas_mobile/src/ui/mensagens.dart';
import 'package:power_vendas_mobile/src/ui/rotas.dart';
import 'package:power_vendas_mobile/src/ui/relatorios.dart';
import 'package:power_vendas_mobile/src/ui/movimentacoes.dart';
import 'package:power_vendas_mobile/src/ui/configuracoes.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Widget _widgetAtual = Home();

  Future<bool> customPop(BuildContext context) {
    if (!bloc.goBack()) {
      return showDialog(
            context: context,
            builder: (context) => new AlertDialog(
                  title: new Text('O aplicativo será fechado.'),
                  content: new Text('Você tem certeza?'),
                  actions: <Widget>[
                    new FlatButton(
                      onPressed: () => Navigator.of(context).pop(false),
                      child: new Text('Não'),
                    ),
                    new FlatButton(
                      textColor: Colors.red,
                      onPressed: () => Navigator.of(context).pop(true),
                      child: new Text('Sim'),
                    ),
                  ],
                ),
          ) ??
          false;
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget widgetBloc;

    bloc.FragmentoAtivo.listen((value) {
      switch (value) {
        case 0:
          widgetBloc = Home();
          break;
        case 1:
          widgetBloc = Clientes();
          break;
        case 2:
          widgetBloc = Pedidos();
          break;
        case 3:
          widgetBloc = Produtos();
          break;
        case 4:
          widgetBloc = Mensagens();
          break;
        case 5:
          widgetBloc = Rotas();
          break;
        case 6:
          widgetBloc = Relatorios();
          break;
        case 7:
          widgetBloc = Movimentacoes();
          break;
        case 8:
          widgetBloc = Configuracoes();
          break;
        default:
          widgetBloc = Home();
      }
      setState(() {
        _widgetAtual = widgetBloc;
      });
    });

    return WillPopScope(
      onWillPop: () {
        return customPop(context);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Power Vendas Mobile'),
        ),
        drawer: Drawer(
          child: Column(
            children: <Widget>[
              UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage("imagens/background.jpg"))),
                  accountName: Text("Thiago de Queiroz"),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: AssetImage("imagens/profile.png"),
                  ),
                  accountEmail: Text("thiago@powervendas.com")),
              ListTile(
                leading: Icon(Icons.home),
                title: Text("Home"),
                onTap: () {
                  Navigator.of(context).pop();
                  bloc.Navegar(Home().id);
                },
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text("Clientes"),
                onTap: () {
                  Navigator.of(context).pop();
                  bloc.Navegar(Clientes().id);
                },
              ),
              ListTile(
                leading: Icon(Icons.receipt),
                title: Text("Pedidos"),
                onTap: () {
                  Navigator.of(context).pop();
                  bloc.Navegar(Pedidos().id);
                },
              ),
              ListTile(
                leading: Icon(Icons.shopping_basket),
                title: Text("Catálogo de produtos"),
                onTap: () {
                  Navigator.of(context).pop();
                  bloc.Navegar(Produtos().id);
                },
              ),
              ListTile(
                leading: Icon(Icons.message),
                title: Text("Mensagens"),
                onTap: () {
                  Navigator.of(context).pop();
                  bloc.Navegar(Mensagens().id);
                },
              ),
              ListTile(
                leading: Icon(Icons.map),
                title: Text("Rotas"),
                onTap: () {
                  Navigator.of(context).pop();
                  bloc.Navegar(Rotas().id);
                },
              ),
              ListTile(
                leading: Icon(Icons.picture_as_pdf),
                title: Text("Relatórios"),
                onTap: () {
                  Navigator.of(context).pop();
                  bloc.Navegar(Relatorios().id);
                },
              ),
              ListTile(
                leading: Icon(Icons.monetization_on),
                title: Text("Lucros e Perdas"),
                onTap: () {
                  Navigator.of(context).pop();
                  bloc.Navegar(Movimentacoes().id);
                },
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text("Configurações"),
                onTap: () {
                  Navigator.of(context).pop();
                  bloc.Navegar(Configuracoes().id);
                },
              ),
            ],
          ),
        ),
        body: _widgetAtual,
      ),
    );
  }
}
