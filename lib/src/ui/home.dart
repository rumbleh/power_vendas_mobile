import 'package:flutter/material.dart';
import 'package:power_vendas_mobile/src/bloc/navigation_bloc.dart';
import 'package:power_vendas_mobile/src/ui/clientes.dart';
import 'package:power_vendas_mobile/src/ui/pedidos.dart';
import 'package:power_vendas_mobile/src/ui/produtos.dart';
import 'package:power_vendas_mobile/src/ui/mensagens.dart';
import 'package:power_vendas_mobile/src/ui/rotas.dart';
import 'package:power_vendas_mobile/src/ui/relatorios.dart';
import 'package:power_vendas_mobile/src/ui/movimentacoes.dart';
import 'package:power_vendas_mobile/src/ui/configuracoes.dart';

class Home extends StatefulWidget {
  int get id => 0;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
    return GridView.count(
      padding: EdgeInsets.all(10),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 2,
      children: <Widget>[
        GridItem(Colors.indigo, Icons.person, "Clientes", "Gerenciar clientes",
            onTap: () {
          bloc.Navegar(Clientes().id);
        }),
        GridItem(Colors.deepPurple, Icons.folder_special, "Pedidos", "Pedidos",
            onTap: () {
          bloc.Navegar(Pedidos().id);
        }),
        GridItem(Colors.red, Icons.receipt, "Produtos", "Catálogo de produtos",
            onTap: () {
          bloc.Navegar(Produtos().id);
        }),
        GridItem(Colors.green, Icons.chat, "Mensagens", "Enviar e receber",
            onTap: () {
          bloc.Navegar(Mensagens().id);
        }),
        GridItem(Colors.amber, Icons.map, "Rotas", "Traçar rota de visita",
            onTap: () {
          bloc.Navegar(Rotas().id);
        }),
        GridItem(Colors.teal, Icons.picture_as_pdf, "Relatórios",
            "Relatórios e gráficos", onTap: () {
          bloc.Navegar(Relatorios().id);
        }),
        GridItem(Colors.lightGreen, Icons.monetization_on, "Lucros e perdas",
            "Movimentações financeiras", onTap: () {
          bloc.Navegar(Movimentacoes().id);
        }),
        GridItem(
            Colors.grey, Icons.settings, "Configurações", "Ajustes do sistema",
            onTap: () {
          bloc.Navegar(Configuracoes().id);
        }),
      ],
    );
  }
}
