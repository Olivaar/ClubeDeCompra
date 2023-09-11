import 'package:flutter/material.dart';

class WidgetMedicamento extends StatelessWidget {

  final String nomeProduto;
  final String apresentacao;
  final String tipoDeProduto;

  const WidgetMedicamento({
    super.key,
    required this.nomeProduto,
    required this.apresentacao,
    required this.tipoDeProduto,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 150,
      child: Card(
        color: const Color(0xffffffff).withOpacity(0.90),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                nomeProduto,
                style: const TextStyle(fontWeight: FontWeight.bold),
                textScaleFactor: 1,
              ),
              Divider(color: Colors.black.withOpacity(0.30),),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      '- $apresentacao',
                      softWrap: true,
                      style: const TextStyle(fontSize: 12 ,),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('- $tipoDeProduto',),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
