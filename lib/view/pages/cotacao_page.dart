import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:clube_de_compra/controller/cotacao_controller.dart';
import 'package:clube_de_compra/controller/medicamento_controller.dart';
import 'package:clube_de_compra/model/entities/cotacao.dart';
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
    medicamentoController.aux();
  }

  TextEditingController pesquisaController = TextEditingController();
  MedicamentoController medicamentoController = MedicamentoController();
  CotacaoController cotacaoController = CotacaoController();

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
                              controller: pesquisaController,
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
                              for(Medicamento medicamento in medicamentoController.medicamentosPesquisados)
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
                                          if(medicamentoController.medicamentosCotados.contains(medicamento)){
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
                                            medicamentoController.medicamentosCotados.add(medicamento);
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
                          for(Medicamento medicamento in medicamentoController.medicamentosCotados)
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
                                      medicamentoController.medicamentosCotados.remove(medicamento);
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
                          if(medicamentoController.medicamentosCotados.isNotEmpty){
                            List<String> cotacaoString = medicamentoController.medicamentosCotados
                                .map((medicamento) => medicamento.nomeProduto).toList();
                            Cotacao cot = Cotacao(
                              data: Timestamp.now(),
                              medicamentos: cotacaoString,
                            );
                            cotacaoController.creatCotacao(cot);
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
                          }else{
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertAviso(
                                  titulo: 'ATENÇÃO!',
                                  texto: 'A cotação deve conter ao menos um medicamento!'
                                );
                              },
                            );
                          }
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
    String textoPesquisa = pesquisaController.text.toLowerCase();

    // Filtra os medicamentos da lista medicamentos da classe MedicamentoController
    List<Medicamento> resultados = medicamentoController.medicamentos.where((medicamento) {
      // Converte o nomeProduto do medicamento para minúsculas e compara com o texto de pesquisa
      String nomeProdutoEmMinusculas = medicamento.nomeProduto.toLowerCase();
      return nomeProdutoEmMinusculas.contains(textoPesquisa);
    }).toList();

    // Atualiza a lista medicamentosSearch com os resultados da pesquisa
    setState(() {
      medicamentoController.medicamentosPesquisados = resultados;
    });
  }

}
