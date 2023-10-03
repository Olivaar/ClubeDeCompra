import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:clube_de_compra/controller/cotacao_controller.dart';
import 'package:flutter/material.dart';

class RowCotacao extends StatelessWidget {

  late String id;
  late Timestamp data;
  late String? status;
  Color color = Colors.orange;

  RowCotacao({
    super.key,
    required this.id,
    required this.data,
    required this.status
  });

  @override
  Widget build(BuildContext context) {
    if(status == 'COTADO'){
      color = Colors.green;
    }
    
    CotacaoController cotacaoController = CotacaoController();

    return Card(
      child: Container(
        padding: const EdgeInsets.all(6),
        height: 40,
        width: 300,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Id: $id',
              style: const TextStyle(fontSize: 20 ,color: Colors.black),
            ),
            const SizedBox(width: 15,),
            const Text(
              '|',
              style: TextStyle(fontSize: 18 ,color: Colors.black),
            ),
            const SizedBox(width: 5,),
            Text(
              'Data: ${cotacaoController.dataCotacaoToString(data)}',
              style: const TextStyle(fontSize: 20 ,color: Colors.black),
            ),
            const SizedBox(width: 15,),
            const Text(
              '|',
              style: TextStyle(fontSize: 18 ,color: Colors.black),
            ),
            const SizedBox(width: 15,),
            Text(
              'Status $status',
              style: TextStyle(
                fontSize: 20 ,
                color: color
              ),
            ),
          ],
        ),
      ),
    );
  }
}
