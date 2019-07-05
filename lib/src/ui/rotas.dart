import 'package:flutter/material.dart';

class Rotas extends StatefulWidget {

  int get id => 5;

  @override
  _RotasState createState() => _RotasState();
}

class _RotasState extends State<Rotas> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 200,
        width: 200,
        alignment: Alignment(0, 0),
        child: Text(
          "Rotas",
          style: TextStyle(fontSize: 40, color: Colors.white),
        ),
        color: Colors.amber,
      ),
    );
  }
}