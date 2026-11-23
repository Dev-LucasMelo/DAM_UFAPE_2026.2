import 'package:flutter/material.dart';

void main() {
  runApp(const PedidoFlashApp());
}

class PedidoFlashApp extends StatelessWidget {
  const PedidoFlashApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pedido Flash',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Pedido Flash'),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
        body: const Center(
          child: Text('Cardápio rápido'),
        ),
      ),
    );
  }
}