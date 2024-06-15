import 'package:beat_the_number_21/main.dart';
import 'package:flutter/material.dart';
import 'package:beat_the_number_21/screens/utils.dart';

class PlayerWonMessage extends StatefulWidget {
  final String winner;
  final Color playerColor;

  const PlayerWonMessage(
      {super.key, required this.winner, required this.playerColor});

  @override
  _PlayerWonMessageState createState() => _PlayerWonMessageState();
}

class _PlayerWonMessageState extends State<PlayerWonMessage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    audioPlayer.playerWon(true);
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _scaleAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    audioPlayer.playerWon(false);
    audioPlayer.backgroundMusic(true);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedOpacity(
        opacity: 1.0,
        duration: const Duration(milliseconds: 500),
        child: ScaleTransition(
          scale: _scaleAnimation,
          child: Container(
            alignment: Alignment.center,
            height: getHeight(context) * 0.1,
            width: getWidth(context) * 0.9,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              boxShadow: const [
                BoxShadow(color: Colors.green, offset: Offset(0, 6))
              ],
            ),
            child: ShaderMask(
              shaderCallback: (bounds) => const RadialGradient(
                center: Alignment.center,
                radius: 1.0,
                colors: [Colors.green, Colors.lightGreenAccent],
                tileMode: TileMode.mirror,
              ).createShader(bounds),
              child: Text(
                widget.winner,
                style: const TextStyle(color: Colors.white, fontSize: 45),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
