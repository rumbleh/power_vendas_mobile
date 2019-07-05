import 'package:flutter/material.dart';

class Configuracoes extends StatefulWidget {

  int get id => 8;

  @override
  _ConfiguracoesState createState() => _ConfiguracoesState();
}

class _ConfiguracoesState extends State<Configuracoes> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 200,
        width: 200,
        alignment: Alignment(0, 0),
        child: Text(
          "Configurações",
          style: TextStyle(fontSize: 40, color: Colors.white),
        ),
        color: Colors.grey,
      ),
    );
  }
}