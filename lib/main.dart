import 'package:flutter/material.dart';
import 'package:power_vendas_mobile/pages/dashboard.dart';

void main() => runApp(PowerVendasMobile());

class PowerVendasMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        darkTheme: ThemeData.dark(),
        title: 'Power Vendas Mobile',
        home: PaginaPrincipal(
          title: 'Power Vendas Mobile',
        ));
  }
}

class PaginaPrincipal extends StatefulWidget {
  PaginaPrincipal({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _PaginaPrincipalState createState() => _PaginaPrincipalState();
}

class _PaginaPrincipalState extends State<PaginaPrincipal> {
  Widget _tela = DashboardPage();

  telaSelecionada(Widget tela) {
    setState(() {
      _tela = tela;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _tela,
        appBar: AppBar(
          title: Text("Power Vendas Mobile"),
          elevation: 2.0,
        ),
        drawer: Drawer(
            child: ListView(padding: EdgeInsets.zero, children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text("José da Silva"),
            accountEmail: Text("josesilva@powervendas.com.br"),
            currentAccountPicture: new CircleAvatar(
              backgroundImage: NetworkImage("https://i.pravatar.cc/150?img=18"),
            ),
          ),
          ListTile(
              title: Text("Dashboard"),
              leading: Icon(Icons.dashboard),
              onTap: () {
                telaSelecionada(DashboardPage());
                Navigator.pop(context);
              }),
          ListTile(
            title: Text("Clientes"),
            leading: Icon(Icons.person_pin),
//            trailing: Icon(Icons.arrow_forward),
            onTap: () {
//              telaSelecionada("Clientes");
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text("Pedidos"),
            leading: Icon(Icons.receipt),
            onTap: () {
//              telaSelecionada("Pedidos");
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text("Relatórios"),
            leading: Icon(Icons.insert_chart),
            onTap: () {
//              telaSelecionada("Relatórios");
              Navigator.pop(context);
            },
          )
        ])));
  }
}
