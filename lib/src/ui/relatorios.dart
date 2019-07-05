import 'package:flutter/material.dart';

class Relatorios extends StatefulWidget {

  int get id => 6;

  @override
  _RelatoriosState createState() => _RelatoriosState();
}

class _RelatoriosState extends State<Relatorios> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 200,
        width: 200,
        alignment: Alignment(0, 0),
        child: Text(
          "Relatórios",
          style: TextStyle(fontSize: 40, color: Colors.white),
        ),
        color: Colors.teal,
      ),
    );
  }
}