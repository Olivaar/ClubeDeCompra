import 'package:clube_de_compra/view/components/theme_helper.dart';
import 'package:flutter/material.dart';

//TODO Terminar de desenvolver pagina de cadastro

class CadastroView extends StatefulWidget{
  const CadastroView({Key? key}) : super(key: key);

  @override
  _CadastroViewState createState() => _CadastroViewState();
}

class _CadastroViewState  extends State<CadastroView>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/logo_essense_sem_fundo.png',
                  height: 200,
                  width: 200,
                )
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Solicitar Cadastro',
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold, color: Color(0xff2EB6FC)),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 500,
                  child: Card(
                    elevation: 18.0,
                    color: const Color(0xff0000FF),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Form(
                        key: Key('formKey'),
                        child: Column(
                          children: [
                            TextFormField(
                              decoration: ThemeHelper().textInputDecoration(
                                  'Nome Completo', 'Digite seu nome completo...'
                              ),
                            ),
                            SizedBox(height: 10,),
                            TextFormField(
                              decoration: ThemeHelper().textInputDecoration(
                                  'E-mail', 'Digite seu e-mail...'
                              ),
                            ),
                            SizedBox(height: 10,),
                            TextFormField(
                              decoration: ThemeHelper().textInputDecoration(
                                  'Telefone', 'Digite telefone...'
                              ),
                            ),
                            SizedBox(height: 10,),
                            TextFormField(
                              obscureText: true,
                              decoration: ThemeHelper().textInputDecoration(
                                  'Senha', 'Digite sua senha...'
                              ),
                            ),
                            SizedBox(height: 5,),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  'ESQUECI MINHA SENHA',
                                  style: TextStyle(color: Colors.white),
                                )
                              ],
                            ),
                            SizedBox(height: 10,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextButton.icon(
                                  onPressed: (){},
                                  icon: Icon(Icons.vaccines),
                                  label: Text('ENTRAR'),
                                  style: ButtonStyle(
                                      backgroundColor: MaterialStateProperty.all<Color>(const Color(0xffFFffff)),
                                      foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                                      textStyle: MaterialStateProperty.all<TextStyle>(const TextStyle(
                                          fontWeight: FontWeight.bold
                                      ))
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 10,),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'NÃO POSSUI CONTA? CADASTRE-SE AGORA',
                                  style: TextStyle(color: Colors.white),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }


}