import 'package:beat_the_number_21/main.dart';
import 'package:beat_the_number_21/screens/utils.dart';
import 'package:flutter/material.dart';

class NavButton extends StatefulWidget {
  final String text, color, navigateTo;
  const NavButton(
      {super.key,
      required this.text,
      required this.color,
      required this.navigateTo});

  @override
  State<NavButton> createState() => _NavButtonState();
}

class _NavButtonState extends State<NavButton> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: const Duration(seconds: 1), vsync: this)
          ..repeat(reverse: true);

    _animation = Tween(begin: 1.0, end: 1.2)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _animation,
      child: Container(
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
                audioPlayer.backgroundMusic(false);
                audioPlayer.gameStart(true);
                Navigator.of(context).pushNamed(widget.navigateTo);
              },
              child: Text(
                widget.text,
                style: const TextStyle(color: Colors.white, fontSize: 18),
              ))),
    );
  }
}
