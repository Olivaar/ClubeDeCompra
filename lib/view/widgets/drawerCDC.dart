import 'package:flutter/material.dart';

class DrawerCDC extends StatelessWidget {
  const DrawerCDC({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: const Color(0xff2EB6FC),
            ),
            child: Text('Clube de Compra'),
          ),
          ListTile(
            title: const Text('Home'),
            onTap: () {
              Navigator.pushNamed(context, '/Home');
            },
          ),
          ListTile(
            title: const Text('Minhas Cotacoes'),
            onTap: () {
            },
          ),
          ListTile(
            title: const Text('Meus Dados'),
            onTap: () {
            },
          ),
        ],
      ),
    );
  }
}
