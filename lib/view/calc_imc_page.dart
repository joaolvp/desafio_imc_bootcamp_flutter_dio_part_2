import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_calculadora_imc_dio/view/widgets/custom_appbar.dart';
import 'package:flutter_calculadora_imc_dio/view_model/gerar_calculo_imc.dart';

class CalcIMCPage extends StatefulWidget {
  const CalcIMCPage({super.key});

  @override
  State<CalcIMCPage> createState() => _CalcIMCPageState();
}

class _CalcIMCPageState extends State<CalcIMCPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController pesoController = TextEditingController();
    TextEditingController alturaController = TextEditingController();
    return Scaffold(
      appBar: const PreferredSize(preferredSize: Size.fromHeight(kToolbarHeight), child: CustomAppBar(title: 'Cálculo de IMC')),

      body: Container(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: pesoController,
              keyboardType:TextInputType.number,
              decoration: const InputDecoration(label: Text('Peso(em quilos)')),
              ),
            TextFormField(
              controller: alturaController,
              keyboardType:TextInputType.number,
              decoration: const InputDecoration(label: Text('Altura(em metros)'))
              ),
            TextButton(onPressed: (){
              try{
                gerarCalculoIMC(double.parse(pesoController.text.replaceAll(',', '.')), double.parse(alturaController.text.replaceAll(',', '.')), context);
              }catch(error){
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Insira formatos de peso e altura válidos'), backgroundColor: Colors.red,));
                return log('$error');

              }
              
            }, child: const Text('Calcular'))
      
        ]),
      ),
    );
  }
}