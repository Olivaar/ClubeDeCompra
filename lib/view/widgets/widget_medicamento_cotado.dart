import 'package:flutter/material.dart';


class WidgetMedicamentoCotado extends StatelessWidget {

  final String nomeProduto;
  final String apresentacao;

  const WidgetMedicamentoCotado({
    super.key,
    required this.nomeProduto,
    required this.apresentacao,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Container(
          padding: const EdgeInsets.all(6),
          height: 40,
          width: 510,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                nomeProduto,
                style: const TextStyle(fontSize: 10 ,color: Colors.black),
              ),
              const SizedBox(width: 5,),
              const Text(
                '|',
                style: TextStyle(fontSize: 12 ,color: Colors.black),
              ),
              const SizedBox(width: 5,),
              Text(
                apresentacao,
                style: const TextStyle(fontSize: 10 ,color: Colors.black),
              ),
            ],
          )
      ),
    );
  }
}
