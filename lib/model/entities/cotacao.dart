import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';

class Cotacao {
  late String id;
  late Timestamp data;
  late List<String> medicamentos = [];
  late String? status = 'PENDENTE';
  late double? valor;

  Cotacao({
    required this.data,
    required this.medicamentos,
    this.status,
    this.valor
  }) {
    id = Random().nextInt(1000000).toString();
  }

  Cotacao.fromJson(Map<String, dynamic> json)
    : id = json['id'],
      data = json['data'],
      medicamentos = (json['medicamentos'] as List<dynamic>?)?.map((e) => e.toString()).toList() ?? [],
      status = json['status'],
      valor = json['valor'];

  Map<String, dynamic> toJson(){
    return{
      'id': id,
      'data': data,
      'medicamentos': medicamentos,
      'status': status,
      'valor': valor,
    };
  }
}
