import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: const Text(
        'Developed with ❤️ by \nGaurav Giri',
        style: TextStyle(fontSize: 16, color: Colors.white70),
        textAlign: TextAlign.center,
      ),
    );
  }
}
