import 'package:flutter/material.dart';

class Movimentacoes extends StatefulWidget {

  int get id => 7;

  @override
  _MovimentacoesState createState() => _MovimentacoesState();
}

class _MovimentacoesState extends State<Movimentacoes> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 200,
        width: 200,
        alignment: Alignment(0, 0),
        child: Text(
          "Lucros e Perdas",
          style: TextStyle(fontSize: 40, color: Colors.white),
        ),
        color: Colors.lightGreen,
      ),
    );
  }
}