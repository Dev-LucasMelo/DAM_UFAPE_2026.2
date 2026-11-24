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
        drawer: Drawer(
          child: Column(
            children: [

              const SizedBox(
                height: 80,
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Menu',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ),
              ),

              const Divider(height: 1),

              ListTile(
                leading: const Icon(Icons.add_circle_outline),
                title: const Text('Novo pedido'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),

              const Divider(height: 1),

              ListTile(
                leading: const Icon(Icons.history),
                title: const Text('Historico'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),

              const Divider(height: 1),

              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('Configurações'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        body: const Center(child: Text('Cardápio rápido')),
      ),
    );
  }
}
