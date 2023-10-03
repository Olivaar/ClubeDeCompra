import 'package:clube_de_compra/controller/cotacao_controller.dart';
import 'package:clube_de_compra/model/entities/cotacao.dart';
import 'package:clube_de_compra/repositories/cotacao_repository.dart';
import 'package:clube_de_compra/view/widgets/appBar_clube_de_compra.dart';
import 'package:clube_de_compra/view/widgets/drawerCDC.dart';
import 'package:clube_de_compra/view/widgets/row_cotacao.dart';
import 'package:flutter/material.dart';

class MinhasCotacoesPage extends StatefulWidget {
  const MinhasCotacoesPage({super.key});

  @override
  State<MinhasCotacoesPage> createState() => _MinhasCotacoesPageState();
}

class _MinhasCotacoesPageState extends State<MinhasCotacoesPage> {

  CotacaoController cotacaoController = CotacaoController();
  CotacaoRepository cotacaoRepository = CotacaoRepository();

  @override
  void initState() {
    super.initState();
    _carregarCotacoes();
  }

  Future<void> _carregarCotacoes() async{
    final cotacoes = await cotacaoRepository.readListCotacao();
    setState(() {
      cotacaoController.cotacoes = cotacoes;
    });
  }

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
          SingleChildScrollView(
            padding: const EdgeInsets.only(top: 40, left: 300, right: 300),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(16, 16,16, 10),
                  decoration: BoxDecoration(
                    color: const Color(0xff2EB6FC),
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(color: Colors.black45),
                  ),
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      for(Cotacao cotacao in cotacaoController.cotacoes)
                        RowCotacao(
                          id: cotacao.id,
                          data: cotacao.data,
                          status: cotacao.status,
                        ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      drawer: const DrawerCDC(),
    );
  }
}
