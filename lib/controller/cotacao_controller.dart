import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:clube_de_compra/model/entities/cotacao.dart';
import 'package:clube_de_compra/repositories/cotacao_repository.dart';

import '../model/entities/medicamento.dart';

class CotacaoController{

  CotacaoRepository cotacaoRepository = CotacaoRepository();

  List<Cotacao> cotacoes = [];


  String dataCotacaoToString(Timestamp dataAniversario) {
    final dateTime = dataAniversario.toDate();
    final day = dateTime.day.toString().padLeft(2, '0');
    final month = dateTime.month.toString().padLeft(2, '0');
    final year = dateTime.year.toString();

    return '$day/$month/$year';
  }

  void creatCotacao(Cotacao cotacao){
    cotacaoRepository.createCotacao(cotacao);
  }
}