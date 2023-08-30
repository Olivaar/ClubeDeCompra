import 'package:clube_de_compra/view/pages/cadastro_page.dart';
import 'package:clube_de_compra/view/pages/login_page.dart';
import 'package:flutter/material.dart';

//TODO Criar Page Recuperacao de senha
//TODO Criar Page Home
//TODO Atualizar imagem de fundo das Pages
//TODO Cirar camada de persitencia de Dados

void main() {
  runApp(const ClubeDeCompra());
}

class ClubeDeCompra extends StatelessWidget {
  const ClubeDeCompra({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clube De Compra',
      routes: {
        '/loginPage': (context) => LoginPage(),
        '/cadastroPage': (context) => CadastroPage(),
      },
      theme: ThemeData(
        primaryColor: const Color(0xff0000FF),

        hintColor: const Color(0xff2EB6FC),
        useMaterial3: true,
      ),
      home: const LoginPage(),
    );
  }
}


