import 'package:clube_de_compra/controller/medicamento_controller.dart';
import 'package:clube_de_compra/model/entities/medicamento.dart';
import 'package:clube_de_compra/view/widgets/alert_aviso.dart';
import 'package:clube_de_compra/view/widgets/appBar_clube_de_compra.dart';
import 'package:clube_de_compra/view/widgets/drawerCDC.dart';
import 'package:clube_de_compra/view/widgets/theme_helper.dart';
import 'package:clube_de_compra/view/widgets/widget_medicamento_cotado.dart';
import 'package:clube_de_compra/view/widgets/widget_medicamento_serch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';

class CotacaoPage extends StatefulWidget {
  const CotacaoPage({super.key});

  @override
  State<CotacaoPage> createState() => _CotacaoPageState();
}

class _CotacaoPageState extends State<CotacaoPage> {

  @override
  void initState(){
    super.initState();
    homeController.aux();
  }

  TextEditingController medicamentoController = TextEditingController();
  MedicamentoController homeController = MedicamentoController();
  late List<Medicamento> medicamentosSearch = [];
  late List<Medicamento> medicamentosCotados = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCDC(),
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
            padding: const EdgeInsets.only(top: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 600,
                  padding: const EdgeInsets.fromLTRB(16, 16,16, 10),
                  decoration: BoxDecoration(
                    color: const Color(0xff2EB6FC),
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(color: Colors.black45),
                  ),
                  child: Column(
                    children: [
                      const Text(
                        'Pesquise o Produto',
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold, color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 15,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 400,
                            child: TextFormField(
                              controller: medicamentoController,
                              decoration: ThemeHelper().textInputDecoration(
                                'Pesquise um produto', 'Digite o nome do produto...',
                              ),
                            ),
                          ),
                          const SizedBox(width: 5,),
                          IconButton(
                            style: ThemeHelper().buttonStyle(),
                            onPressed: () {
                              buscarMedicamentos();
                            },
                            icon: const Icon(Icons.search_rounded, color: Colors.white,),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15,),
                      SizedBox(
                        child: SingleChildScrollView(
                          child: ListView(
                            shrinkWrap: true,
                            children: [
                              for(Medicamento medicamento in medicamentosSearch)
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    WidgetMedicamentoSearch(
                                      nomeProduto: medicamento.nomeProduto,
                                      apresentacao: medicamento.apresentacao,
                                      onPressed: (){},
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        setState(() {
                                          if(medicamentosCotados.contains(medicamento)){
                                            showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertAviso(
                                                  titulo: 'ATENÇÃO!',
                                                  texto: 'O produto ja está inserido na cotação!'
                                                );
                                              },
                                            );
                                          } else {
                                            medicamentosCotados.add(medicamento);
                                          }
                                        });
                                      },
                                      icon: const Icon(Icons.add, color: Colors.white,),
                                    )
                                  ],
                                ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  width: 600,
                  padding: const EdgeInsets.fromLTRB(16, 16,16, 10),
                  decoration: BoxDecoration(
                    color: const Color(0xff2EB6FC),
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(color: Colors.black45),
                  ),
                  child: Column(
                    children: [
                      const Text(
                        'Nova cotacao',
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold, color: Colors.white,
                        ),
                      ),
                      ListView(
                        shrinkWrap: true,
                        children: [
                          for(Medicamento medicamento in medicamentosCotados)
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                WidgetMedicamentoCotado(
                                  nomeProduto: medicamento.nomeProduto,
                                  apresentacao: medicamento.apresentacao,
                                ),
                                IconButton(
                                  onPressed: (){
                                    setState(() {
                                      medicamentosCotados.remove(medicamento);
                                    });
                                  },
                                  icon: const Icon(Icons.delete, color: Colors.white,),
                                )
                              ],
                            ),
                        ],
                      ),
                      TextButton.icon(
                        onPressed: (){
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertAviso(
                                titulo: 'COTAÇÃO SOLICITADA!',
                                texto: 'Enviamos sua cotação para os fornecedores e em até 24 horas será respondida. \n'
                                  'Caso não seja respondida neste prazo, a cotação será excluída automaticamente.',
                              );
                            },
                          );
                        },
                        icon: const Icon(Icons.vaccines),
                        label: const Text('SOLICITAR COTACAO'),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(const Color(0xffFFffff)),
                          foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                          textStyle: MaterialStateProperty.all<TextStyle>(const TextStyle(
                            fontWeight: FontWeight.bold,
                          ))
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
      drawer: const DrawerCDC(),
    );
  }

  buscarMedicamentos() {
    // Obtém o texto da pesquisa do medicamentoController
    String textoPesquisa = medicamentoController.text.toLowerCase();

    // Filtra os medicamentos da lista medicamentos da classe MedicamentoController
    List<Medicamento> resultados = homeController.medicamentos.where((medicamento) {
      // Converte o nomeProduto do medicamento para minúsculas e compara com o texto de pesquisa
      String nomeProdutoEmMinusculas = medicamento.nomeProduto.toLowerCase();
      return nomeProdutoEmMinusculas.contains(textoPesquisa);
    }).toList();

    // Atualiza a lista medicamentosSearch com os resultados da pesquisa
    setState(() {
      medicamentosSearch = resultados;
    });
  }

}
