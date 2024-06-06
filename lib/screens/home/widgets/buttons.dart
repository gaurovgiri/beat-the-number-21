import 'package:beat_the_number_21/screens/utils.dart';
import 'package:flutter/material.dart';

class NavButton extends StatelessWidget {
  final String text, color, navigateTo;
  const NavButton(
      {super.key,
      required this.text,
      required this.color,
      required this.navigateTo});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: getWidth(context) * 0.65,
        height: getHeight(context) * 0.08,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 1),
            boxShadow: const [
              BoxShadow(
                  color: Colors.black,
                  offset: Offset(0, 4),
                  blurRadius: 2,
                  spreadRadius: 0.5,
                  blurStyle: BlurStyle.normal)
            ],
            color: const Color(0xFF2CB073),
            borderRadius: BorderRadius.circular(50)),
        child: TextButton(
            onPressed: () {
              Navigator.of(context).pushNamed(navigateTo);
            },
            child: Text(
              text,
              style: const TextStyle(color: Colors.white, fontSize: 18),
            )));
  }
}
