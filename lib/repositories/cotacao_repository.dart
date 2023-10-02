import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:clube_de_compra/model/entities/cotacao.dart';

class CotacaoRepository{
  final db = FirebaseFirestore.instance;

  void createCotacao(Cotacao cotacao){
    final cotacaoJson = cotacao.toJson();
    db.collection('cotacoes').doc(cotacao.id).set(cotacaoJson);
  }

  Future<List<Cotacao>> readListCotacao() async{
    final cotacoes = await db.collection('cotacoes').get();

    final cotacoesList = cotacoes.docs
      .map((doc) => Cotacao.fromJson(doc.data() as Map<String, dynamic>))
      .toList();

    cotacoesList.sort((a, b){
      final dataCotacaoA = a.data.toDate();
      final dataCotacaoB = b.data.toDate();
      return dataCotacaoA.compareTo(dataCotacaoB);
    });

    return cotacoesList.isEmpty ? [] : cotacoesList;
  }

  void updateCotacaoById(String id, Cotacao updateCotacao){
    final updateCotacaoJson = updateCotacao.toJson();
    db.collection('cotacoes').doc(id).update(updateCotacaoJson);
  }

  void deleteCotacaoById(String id){
    db.collection('cotacoes').doc(id).delete();
  }
}