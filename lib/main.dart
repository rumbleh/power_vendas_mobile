import 'package:flutter/material.dart';

void main() => runApp(PowerVendasMobile());

class PowerVendasMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        darkTheme: ThemeData.dark(),
        title: 'Power Vendas Mobile',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          primaryColorDark: Colors.redAccent,
        ),
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
  String tela = "";

  telaSelecionada(String valor) {
    setState(() {
      tela = valor;
    });
    return Text(tela);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("Escolha"),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Column(
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: Image(
                      image: AssetImage( "profile.png"),
                    ),
                  )
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
                backgroundBlendMode: BlendMode.colorDodge,
              ),
            ),
            ListTile(
              title: Text('Dashboard'),
              onTap: () {
                telaSelecionada("DashBoard");
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Pedidos'),
              onTap: () {
                telaSelecionada("DashBoard");
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
