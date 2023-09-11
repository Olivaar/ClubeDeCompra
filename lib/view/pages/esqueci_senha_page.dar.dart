import 'package:clube_de_compra/view/widgets/theme_helper.dart';
import 'package:flutter/material.dart';

class EsqueciSenhaPage extends StatelessWidget {
  const EsqueciSenhaPage({super.key});

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
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/logo_essense_sem_fundo.png',
                    height: 250,
                    width: 250,
                  )
                ],
              ),
              SizedBox(
                width: 500,
                child: Card(
                  elevation: 18.0,
                  color: const Color(0xff0000FF),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        const Text(
                          'Recuperar senha',
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold, color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 10,),
                        const Text(
                          'E-MAIL PARA RECUPERACAO',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.normal, color: Colors.white,
                          ),
                        ),
                        TextFormField(
                          decoration: ThemeHelper().textInputDecoration(
                            'E-mail', 'Digite o e-mail para recuperacao de senha...',
                          ),
                        ),
                        const SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton.icon(
                              onPressed: (){
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text('E-MAIL ENVIADO COM SUCESSO!'),
                                      content: const Text(
                                          'Click no link enviado para seu e-mail '
                                          'para continuar com a redefinicao de senha!',
                                      ),
                                      actions: [
                                        TextButton(
                                          child: const Text('Fechar'),
                                          onPressed: () {
                                            Navigator.pushNamed(context, '/Login');
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              icon: const Icon(Icons.vaccines),
                              label: const Text('ENVIAR E-MAIL'),
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<Color>(const Color(0xffFFffff)),
                                foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                                textStyle: MaterialStateProperty.all<TextStyle>(const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ))
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
