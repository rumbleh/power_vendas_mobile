import 'package:flutter/material.dart';
import 'dart:async';

class GerenciarPedidos extends StatefulWidget {
  final String title;

  GerenciarPedidos({Key key, this.title}) : super(key: key);

  @override
  _GerenciarPedidosState createState() => _GerenciarPedidosState();
}

class _GerenciarPedidosState extends State<GerenciarPedidos> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
          print("...");
          //Navigator.push(context, Route());
        },
        child: Text("Oi estou nos pedidos"),
        );
  }
}
