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
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Cardápio rápido',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 16),

              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      const Icon(Icons.lunch_dining, size: 40),
                      const SizedBox(width: 16),
                      const Text('Hambúrguer'),
                      const Spacer(),
                      const Text('R\$ 22,90'),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 16),

              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      const Icon(Icons.local_pizza, size: 40),
                      const SizedBox(width: 16),
                      const Text('Pizza'),
                      const Spacer(),
                      const Text('R\$ 35,90'),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 16),

              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      const Icon(Icons.coffee, size: 40),
                      const SizedBox(width: 16),
                      const Text('Café'),
                      const Spacer(),
                      const Text('R\$ 5,00'),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 16),
              
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      const Icon(Icons.local_drink, size: 40),
                      const SizedBox(width: 16),
                      const Text('Refrigerante'),
                      const Spacer(),
                      const Text('R\$ 7,00'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
