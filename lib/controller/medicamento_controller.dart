import 'package:clube_de_compra/model/entities/medicamento.dart';

class MedicamentoController {
  List<Medicamento> medicamentos = [];

  Medicamento medicamentoTeste = Medicamento(
    nomeProduto: 'SULFATO DE MAGNÉSIO HEPTAHIDRATADO',
    apresentacao: '10% SOL INJ IV CX 50 FR AMP VD TRANS X 50 ML',
    tipoDeProduto: 'Novo',
  );
  Medicamento medicamentoTeste1 = Medicamento(
    nomeProduto: 'BUSCOPAN',
    apresentacao: '20 MG SOL INJ CT 5 AMP VD TRANS X 1 ML',
    tipoDeProduto: 'Novo',
  );
  Medicamento medicamentoTeste2 = Medicamento(
      nomeProduto: 'BUSCOPAN COMPOSTO',
      apresentacao: '(4,0 + 500,0) MG/ML SOL INJ IV/IM CT 3 AMP VD AMB X 5 ML',
      tipoDeProduto: 'Específico',
    );
  Medicamento medicamentoTeste3 = Medicamento(
      nomeProduto: 'DEPOSTERON',
      apresentacao: '100 MG/ML SOL INJ CX 3 AMP VD AMB X 2 ML',
      tipoDeProduto: 'Similar',
    );
  Medicamento medicamentoTeste4 = Medicamento(
      nomeProduto: 'SPRAVATO',
      apresentacao: '140 MG/ML SOL SPR NAS CT FR VD TRANS X 0,2 ML + DISP INAL (28 MG)',
      tipoDeProduto: 'Novo',
    );
  Medicamento medicamentoTeste5 = Medicamento(
      nomeProduto: 'ATORVASTATINA CÁLCICA',
      apresentacao: '20 MG COM REV CT BL AL AL X 500 (EMB HOSP)',
      tipoDeProduto: 'Genérico',
    );
  

  void aux(){
    medicamentos.add(medicamentoTeste);
    medicamentos.add(medicamentoTeste1);
    medicamentos.add(medicamentoTeste2);
    medicamentos.add(medicamentoTeste3);
    medicamentos.add(medicamentoTeste4);
    medicamentos.add(medicamentoTeste5);
  }
}