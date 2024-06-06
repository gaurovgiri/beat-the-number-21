import 'package:flutter/material.dart';
import 'package:beat_the_number_21/providers/player_provider.dart';
import 'package:provider/provider.dart';

class GameAppBar extends StatelessWidget {
  // Remove the @override annotation
  final Size preferredSize;

  const GameAppBar({Key? key})
      : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      elevation: 0,
      actions: [
        IconButton(
          onPressed: () {
            context.read<PlayerProvider>().resetGame();
            Navigator.of(context).popAndPushNamed("/");
          },
          icon: const Icon(
            Icons.close,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
