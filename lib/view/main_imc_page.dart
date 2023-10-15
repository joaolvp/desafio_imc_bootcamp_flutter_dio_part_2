import 'package:flutter/material.dart';
import 'package:flutter_calculadora_imc_dio/view/calc_imc_page.dart';
import 'package:flutter_calculadora_imc_dio/view/lista_imc_page.dart';

class MainIMCPage extends StatefulWidget {
  const MainIMCPage({super.key});

  @override
  State<MainIMCPage> createState() =>
      _MainIMCPageState();
}

class _MainIMCPageState extends State<MainIMCPage> {
  int currentIndex = 0;
  List pages = [const CalcIMCPage(), const ListaIMCPage()];
  @override
  Widget build(BuildContext context) {
    void selected(int value) {
      setState(() {
        currentIndex = value;
      });
    }

    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor:const Color(0xff008B8B),
        unselectedItemColor: Colors.grey.withOpacity(0.45),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.calculate), label: 'Calcular'),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Listar'),
        ],
        currentIndex: currentIndex,
        onTap: selected,
      ),
    );
  }
}
