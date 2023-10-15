import 'package:flutter/material.dart';
import 'package:flutter_calculadora_imc_dio/model/imc.dart';
import 'package:shared_preferences/shared_preferences.dart';

teste(double peso, double altura, double imc, String imcTipo)async{
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String> items = prefs.getStringList('items') ?? [];
  items.addAll(['$peso / ($altura)² = ${imc.toStringAsFixed(2)} => $imcTipo']);
  await prefs.setStringList('items', items);

}


gerarCalculoIMC(double peso, double altura, BuildContext context)async{
  
  var dados = DadosIMC(peso, altura);
  var imc = dados.calcular();
  switch (imc) {
  case < 16:
    teste(peso, altura, imc, 'Magreza grave');
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Center(child: Text('Magreza grave', style: TextStyle(color: Colors.red),)),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Seu IMC é de ${imc.toStringAsFixed(2)}'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Fechar'),
            ),
          ],
        );
      },
    );
  case  >= 16 &&  < 17:
  teste(peso, altura, imc, 'Magreza moderada');
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Center(child: Text('Magreza moderada', style: TextStyle(color: Colors.red),)),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Seu IMC é de ${imc.toStringAsFixed(2)}'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Fechar'),
            ),
          ],
        );
      },
    );
  case  >= 17 &&  < 18.5:
  teste(peso, altura, imc, 'Magreza leve');
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Center(child: Text('Magreza leve', style: TextStyle(color: Colors.red),)),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Seu IMC é de ${imc.toStringAsFixed(2)}'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Fechar'),
            ),
          ],
        );
      },
    );
  case >= 18.5 && < 25:
  teste(peso, altura, imc, 'Saudável');
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Center(child: Text('Saudável', style: TextStyle(color: Color(0xff008B8B)),)),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Seu IMC é de ${imc.toStringAsFixed(2)}'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Fechar'),
            ),
          ],
        );
      },
    );
  case >= 25 && < 30:
  teste(peso, altura, imc, 'Sobrepeso');
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Center(child: Text('Sobrepeso', style: TextStyle(color: Colors.red),)),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Seu IMC é de ${imc.toStringAsFixed(2)}'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Fechar'),
            ),
          ],
        );
      },
    );
  case >= 30 && < 35:
  teste(peso, altura, imc, 'Obesidade Grau I');
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Center(child: Text('Obesidade Grau I', style: TextStyle(color: Colors.red),)),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Seu IMC é de ${imc.toStringAsFixed(2)}'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Fechar'),
            ),
          ],
        );
      },
    );
  case >= 35 && < 40:
  teste(peso, altura, imc, 'Obesidade Grau II (severa)');
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Center(child: Text('Obesidade Grau II (severa)', style: TextStyle(color: Colors.red),)),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Seu IMC é de ${imc.toStringAsFixed(2)}'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Fechar'),
            ),
          ],
        );
      },
    );
  case >= 40:
  teste(peso, altura, imc, 'Obesidade Grau III (mórbida)');
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Center(child: Text('Obesidade Grau III (mórbida)', style: TextStyle(color: Colors.red),)),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Seu IMC é de ${imc.toStringAsFixed(2)}'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Fechar'),
            ),
          ],
        );
      },
    );
}

}