import 'package:flutter/material.dart';
import 'package:power_vendas_mobile/pages/gerenciar_clientes.dart';
import 'package:power_vendas_mobile/pages/pagina_principal.dart';

void main() => runApp(PowerVendasMobile());

class PowerVendasMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData.dark(),
      initialRoute: '/',
      routes: {
        '/': (context) => PaginaPrincipal(title: 'Power Vendas Mobile'),
        '/clientes/listar': (context) => GerenciarClientes(title: 'Power Vendas Mobile'),
      },
      title: 'Power Vendas Mobile',
    );
  }
}

