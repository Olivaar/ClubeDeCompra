import 'package:clube_de_compra/view/pages/cadastro_page.dart';
import 'package:clube_de_compra/view/pages/cotacao_page.dart';
import 'package:clube_de_compra/view/pages/esqueci_senha_page.dar.dart';
import 'package:clube_de_compra/view/pages/home_page.dart';
import 'package:clube_de_compra/view/pages/login_page.dart';
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const ClubeDeCompra());
}

class ClubeDeCompra extends StatelessWidget {
  const ClubeDeCompra({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clube De Compra',
      routes: {
        '/Login': (context) => LoginPage(),
        '/Cadastro': (context) => CadastroPage(),
        '/EsqueciSenha': (context) => EsqueciSenhaPage(),
        '/Home': (context) => const HomePage(),
        '/Cotacao': (context) => CotacaoPage(),
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


