import 'package:flutter/material.dart';

class Mensagens extends StatefulWidget {

  int get id => 4;

  @override
  _MensagensState createState() => _MensagensState();
}

class _MensagensState extends State<Mensagens> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 200,
        width: 200,
        alignment: Alignment(0, 0),
        child: Text(
          "Mensagens",
          style: TextStyle(fontSize: 40, color: Colors.white),
        ),
        color: Colors.green,
      ),
    );
  }
}