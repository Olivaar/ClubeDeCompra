class Medicamento {
  late String nomeProduto;
  late String apresentacao;
  late String tipoDeProduto;


  Medicamento({
    required this.nomeProduto,
    required this.apresentacao,
    required this.tipoDeProduto,
  });

  @override
  String toString() {
    return 'Medicamento{nomeProduto: $nomeProduto, apresentacao: $apresentacao, tipoDeProduto: $tipoDeProduto}';
  }
}