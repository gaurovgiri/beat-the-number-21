import 'package:flutter/material.dart';

class ExitDialogue extends StatelessWidget {
  const ExitDialogue({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Exit'),
      content: const Text('Are you sure you want to exit?'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pushNamed('/');
          },
          child: const Text('Exit'),
        ),
      ],
    );
  }
}
