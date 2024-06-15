import 'package:beat_the_number_21/controllers/audio_controller.dart';
import 'package:beat_the_number_21/providers/player_provider.dart';
import 'package:beat_the_number_21/screens/game/game_screen.dart';
import 'package:beat_the_number_21/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

GameAudio audioPlayer = GameAudio();

Future<void> main() async {
  runApp(const BeatTheNumber21());
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  WidgetsFlutterBinding.ensureInitialized();
}

class BeatTheNumber21 extends StatelessWidget {
  const BeatTheNumber21({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => PlayerProvider(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: "/",
          routes: {
            "/": (BuildContext context) {
              Provider.of<PlayerProvider>(context, listen: false)
                  .game
                  .resetGame();
              return const HomeScreen();
            },
            "/playervscpu": (BuildContext context) =>
                const GameScreen(cpu: true),
            "/playervsplayer": (BuildContext context) =>
                const GameScreen(cpu: false)
          },
          theme: ThemeData(fontFamily: "FredokaOne"),
        ));
  }
}
