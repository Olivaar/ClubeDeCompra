import 'package:flutter/material.dart';

class WidgetMedicamentoSearch extends StatelessWidget {

  final String nomeProduto;
  final String apresentacao;
  final Function onPressed;

  const WidgetMedicamentoSearch({
    super.key,
    required this.nomeProduto,
    required this.apresentacao,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Container(
        padding: EdgeInsets.all(6),
        height: 40,
        child: TextButton(
          onPressed: () {
            onPressed;
          },
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
                style: const TextStyle(fontSize: 10 ,color: Colors.black),)
              ,
            ],
          ),
        )
      ),
    );
  }
}
