import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  final title = "Beat The Number\n21";
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Stack(children: [
      Text(
        textAlign: TextAlign.center,
        title,
        style: TextStyle(
            fontSize: 28.44,
            fontWeight: FontWeight.bold,
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = 3
              ..color = Colors.black),
      ),
      Text(
        textAlign: TextAlign.center,
        title,
        style: const TextStyle(
            fontWeight: FontWeight.bold, fontSize: 28.44, color: Colors.white),
      ),
    ]));
  }
}
