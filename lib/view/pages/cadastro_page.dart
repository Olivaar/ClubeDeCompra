import 'package:clube_de_compra/view/widgets/theme_helper.dart';
import 'package:flutter/material.dart';

//TODO Configurar envio do e-mail

class CadastroPage extends StatefulWidget{
  const CadastroPage({Key? key}) : super(key: key);

  @override
  _CadastroPageState createState() => _CadastroPageState();
}

class _CadastroPageState  extends State<CadastroPage>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
          SingleChildScrollView(
            child: Column(
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
                Container(
                  width: 500,
                  child: Card(
                    elevation: 18.0,
                    color: const Color(0xff0000FF),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          const Text(
                            'Solicitar Cadastro',
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold, color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 10,),
                          const Text(
                            'DADOS PESSOAIS',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.normal, color: Colors.white,
                            ),
                          ),
                          TextFormField(
                            decoration: ThemeHelper().textInputDecoration(
                              'Nome Completo', 'Digite seu nome completo...',
                            ),
                          ),
                          const SizedBox(height: 4,),
                          TextFormField(
                            decoration: ThemeHelper().textInputDecoration(
                              'E-mail', 'Digite seu e-mail...',
                            ),
                          ),
                          const SizedBox(height: 4,),
                          TextFormField(
                            decoration: ThemeHelper().textInputDecoration(
                              'Telefone', 'Digite telefone...',
                            ),
                          ),
                          const SizedBox(height: 4,),
                          Divider(),
                          const Text(
                            'DADOS DA EMPRESA',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.normal, color: Colors.white,
                            ),
                          ),
                          TextFormField(
                            decoration: ThemeHelper().textInputDecoration(
                              'CNPJ', 'Digite o CNPJ da empresa...',
                            ),
                          ),
                          const SizedBox(height: 4,),
                          TextFormField(
                            decoration: ThemeHelper().textInputDecoration(
                              'Nome da empresa', 'Digite o nome da empresa...',
                            ),
                          ),
                          const SizedBox(height: 4,),
                          TextFormField(
                            decoration: ThemeHelper().textInputDecoration(
                              'Nome fantasia', 'Digite o nome fantasia...',
                            ),
                          ),
                          const SizedBox(height: 4,),
                          TextFormField(
                            decoration: ThemeHelper().textInputDecoration(
                              'E-mail da empresa', 'Digite o e-mail da emrpesa...',
                            ),
                          ),
                          const SizedBox(height: 4,),
                          TextFormField(
                            decoration: ThemeHelper().textInputDecoration(
                              'Telefone da empresa', 'Digite o telefone da emrpesa...',
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
                                        title: const Text('CONTA SOLICITADA!'),
                                        content: const Text(
                                          'Eviamos sua solicitação para o Administrador do sistema,\n'
                                          'fique atento ao seu e-mail pois enviaremos a resposta por lá!'
                                        ),
                                        actions: [
                                          TextButton(
                                            child: const Text('Fechar'),
                                            onPressed: () {
                                              Navigator.pushNamed(context, '/loginPage');
                                            },
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                icon: Icon(Icons.vaccines),
                                label: Text('SOLICITAR CONTA'),
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
          ),
        ],
      ),
    );
  }


}