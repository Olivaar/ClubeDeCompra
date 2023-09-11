import 'package:clube_de_compra/controller/medicamento_controller.dart';
import 'package:clube_de_compra/model/entities/medicamento.dart';
import 'package:clube_de_compra/view/widgets/appBar_clube_de_compra.dart';
import 'package:clube_de_compra/view/widgets/drawerCDC.dart';
import 'package:clube_de_compra/view/widgets/theme_helper.dart';
import 'package:clube_de_compra/view/widgets/widget_medicamento.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {

  @override
  void initState(){
    super.initState();
    homeController.aux();
  }

  MedicamentoController homeController = MedicamentoController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarCDC(),
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
            color: Colors.white.withOpacity(0.50),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/logo_essense_sem_fundo.png',
                      height: 100,
                      width: 100,
                    ),
                    SizedBox(
                      width: 500,
                      child: TextFormField(
                        decoration: ThemeHelper().textInputDecoration(
                          'Pesquise um produto', 'Digite o nome do produto...',
                        ),
                      ),
                    ),
                    const SizedBox(width: 5,),
                    IconButton(
                      style: ThemeHelper().buttonStyle(),
                      onPressed: () {

                      },
                      icon: const Icon(Icons.search_rounded),
                    ),
                    TextButton(
                      onPressed: () async{
                        Navigator.pushNamed(context, '/Cotacao');
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(const Color(0xff2EB6FC)),
                        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                        textStyle: MaterialStateProperty.all<TextStyle>(const TextStyle(
                          fontWeight: FontWeight.bold,
                        )),
                      ),
                      child: const Text('NOVA COTACAO'),
                    ),
                  ],
                ),
                Divider(
                  color: Colors.black.withOpacity(0.20),
                ),
                const Row(
                  children: [
                    SizedBox(width: 20,),
                    Text(
                      'Produtos mais procurados',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold, color: Colors.black,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for(Medicamento medicamento in homeController.medicamentos)
                        WidgetMedicamento(
                          nomeProduto: medicamento.nomeProduto,
                          apresentacao: medicamento.apresentacao,
                          tipoDeProduto: medicamento.tipoDeProduto,
                        ),
                    ],
                  ),
                ),
                Divider(
                  color: Colors.black.withOpacity(0.20),
                ),
                SizedBox(height: 20,),
                const Row(
                  children: [
                    SizedBox(width: 20,),
                    Text(
                      'Parceiros',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold, color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      drawer: const DrawerCDC(),
    );
  }
}
