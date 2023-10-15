import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final title;
  const CustomAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('$title'),
      backgroundColor: const Color(0xff008B8B),
    );
  }
}