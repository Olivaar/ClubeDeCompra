import 'package:clube_de_compra/view/widgets/theme_helper.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget{
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState  extends State<LoginPage>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/teste_clube.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            color: const Color(0xff2EB6FC).withOpacity(0.30),
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 400,
                  height: 350,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/logo_essense_sem_fundo.png',
                        height: 200,
                        width: 200,
                      ),
                      const SizedBox(height: 10,),
                      Container(
                        padding: EdgeInsets.all(8),
                        margin: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: const Color(0xff0000FF),
                        ),
                        child: const Text(
                          'Somos a Essence Brasil a maior plataforma de cotação '
                          'de produtos farmaceuticos em território nacional!',
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(16),
                  width: 400,
                  height: 350,
                  decoration: const BoxDecoration(
                    color: const Color(0xff0000FF),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                  child: Column(
                    children: [
                      const Text(
                        'Bem Vindo!',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold, color: Colors.white,
                        ),
                      ),
                      const Text(
                        'Faça Seu Login',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.normal, color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 30,),
                      TextFormField(
                        decoration: ThemeHelper().textInputDecoration(
                          'E-mail', 'Digite seu e-mail...',
                        ),
                      ),
                      SizedBox(height: 10,),
                      TextFormField(
                        obscureText: true,
                        decoration: ThemeHelper().textInputDecoration(
                          'Senha', 'Digite sua senha...',
                        ),
                      ),
                      SizedBox(height: 5,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                              textStyle: MaterialStateProperty.all<TextStyle>(const TextStyle(
                              ))
                            ),
                            onPressed: (){
                              Navigator.pushNamed(context, '/EsqueciSenha');
                            },
                            child: const Text(
                              'esqueci minha senha',
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton.icon(
                            onPressed: (){
                              Navigator.pushNamed(context, '/Home');
                            },
                            icon: Icon(Icons.vaccines),
                            label: Text('ENTRAR'),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(const Color(0xffFFffff)),
                              foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                              textStyle: MaterialStateProperty.all<TextStyle>(const TextStyle(
                                fontWeight: FontWeight.bold
                              ))
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                              textStyle: MaterialStateProperty.all<TextStyle>(const TextStyle(
                              ))
                            ),
                            onPressed: (){
                              Navigator.pushNamed(context, '/Cadastro');
                            },
                            child: const Text(
                              'NÃO POSSUI UMA CONTA? CADASTRE-SE AGORA',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }


}