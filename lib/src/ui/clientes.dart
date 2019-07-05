import 'package:flutter/material.dart';

class Clientes extends StatefulWidget {

  int get id => 1;

  @override
  _ClientesState createState() => _ClientesState();
}

class _ClientesState extends State<Clientes> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 200,
        width: 200,
        alignment: Alignment(0, 0),
        child: Text(
          "Clientes",
          style: TextStyle(fontSize: 40, color: Colors.white),
        ),
        color: Colors.indigo,
      ),
    );
  }
}