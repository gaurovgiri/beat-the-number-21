import 'package:beat_the_number_21/screens/game/widgets/gameappbar.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

class PartyPopper extends StatefulWidget {
  final bool show;

  const PartyPopper({super.key, required this.show});

  @override
  _PartyPopperState createState() => _PartyPopperState();
}

class _PartyPopperState extends State<PartyPopper> {
  late ConfettiController _confettiController;

  @override
  void initState() {
    super.initState();
    _confettiController =
        ConfettiController(duration: const Duration(seconds: 1));
  }

  @override
  void didUpdateWidget(PartyPopper oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.show) {
      _confettiController.play();
    } else {
      _confettiController.stop();
    }
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: ConfettiWidget(
            confettiController: _confettiController,
            blastDirectionality: BlastDirectionality.explosive,
            shouldLoop: false,
            colors: const [
              Colors.red,
              Colors.blue,
              Colors.green,
              Colors.yellow
            ],
            createParticlePath: drawStar, // Define the shape of the confetti
          ),
        ),
      ],
    );
  }
}

Path drawStar(Size size) {
  // Method to draw a star shape
  final Path path = Path();
  final double width = size.width;
  final double height = size.height;
  path.moveTo(width / 2, 0);
  path.lineTo(width * 0.618, height * 0.618);
  path.lineTo(width, height * 0.618);
  path.lineTo(width * 0.691, height * 0.809);
  path.lineTo(width * 0.809, height);
  path.lineTo(width / 2, height * 0.854);
  path.lineTo(width * 0.191, height);
  path.lineTo(width * 0.309, height * 0.809);
  path.lineTo(0, height * 0.618);
  path.lineTo(width * 0.382, height * 0.618);
  path.close();
  return path;
}
