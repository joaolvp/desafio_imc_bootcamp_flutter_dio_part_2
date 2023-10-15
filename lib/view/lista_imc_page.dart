import 'package:flutter/material.dart';
import 'package:flutter_calculadora_imc_dio/view/widgets/custom_appbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ListaIMCPage extends StatefulWidget {
  const ListaIMCPage({super.key});

  @override
  State<ListaIMCPage> createState() => _ListaIMCPageState();
}


class _ListaIMCPageState extends State<ListaIMCPage> {
  List<String> lista = [];

  @override
  void initState() {
    super.initState();
    attLista();
  }

  attLista() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      lista = prefs.getStringList('items') ?? [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: CustomAppBar(title: 'Lista de IMC')),
        body: ListView.builder(
            itemCount: lista.length,
            itemBuilder: (context, index) {
              return Center(
                  child: Container(
                      padding: const EdgeInsets.all(10),
                      child: Text(lista[index], style: TextStyle(fontSize: 20, color: lista[index].split('=>')[1].toString().trim() == 'Saudável' ? Colors.green : Colors.red),)));
            }));
  }
}
