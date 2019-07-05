import 'package:flutter/material.dart';
import 'package:power_vendas_mobile/src/ui/menu.dart';

class PowerVendasMobile extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Power Vendas Mobile',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

