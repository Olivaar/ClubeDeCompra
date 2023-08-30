import 'package:clube_de_compra/view/view/login_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ClubeDeCompra());
}

class ClubeDeCompra extends StatelessWidget {
  const ClubeDeCompra({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clube De Compra',
      theme: ThemeData(
        primaryColor: Color(0xff0000FF),

        hintColor: Color(0xff2EB6FC),
        useMaterial3: true,
      ),
      home: LoginView(),
    );
  }
}


