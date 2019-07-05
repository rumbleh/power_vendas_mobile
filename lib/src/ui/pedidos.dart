import 'package:flutter/material.dart';

class Pedidos extends StatefulWidget {

  int get id => 2;
  @override
  _PedidosState createState() => _PedidosState();
}

class _PedidosState extends State<Pedidos> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 200,
        width: 200,
        alignment: Alignment(0, 0),
        child: Text(
          "Pedidos",
          style: TextStyle(fontSize: 40, color: Colors.white),
        ),
        color: Colors.deepPurple,
      ),
    );
  }
}