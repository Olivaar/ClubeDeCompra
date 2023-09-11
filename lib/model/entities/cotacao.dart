import 'package:clube_de_compra/model/entities/medicamento.dart';

class Cotacao {
  late int id;
  late DateTime data;
  late String? status;
  late List<Medicamento> medicamentos = [];

  Cotacao({
    required this.id,
    required this.data,
    required this.medicamentos,
    this.status
  });

  @override
  String toString() {
    return 'Cotacao{id: $id, data: $data, medicamentos: $medicamentos}';
  }
}
