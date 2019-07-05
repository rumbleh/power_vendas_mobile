import 'package:flutter/material.dart';

class Produtos extends StatefulWidget {

  int get id => 3;

  @override
  _ProdutosState createState() => _ProdutosState();
}

class _ProdutosState extends State<Produtos> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 200,
        width: 200,
        alignment: Alignment(0, 0),
        child: Text(
          "Produtos",
          style: TextStyle(fontSize: 40, color: Colors.white),
        ),
        color: Colors.red,
      ),
    );
  }
}