import 'package:audioplayers/audioplayers.dart';

class GameAudio {
  late AudioPlayer audioPlayer;

  GameAudio() {
    audioPlayer = AudioPlayer();
  }

  void backgroundMusic(bool play) async {
    if (play) {
      audioPlayer.setReleaseMode(ReleaseMode.loop);
      await audioPlayer.setSource(AssetSource("audios/background_music.mp3"));
      await audioPlayer.resume();
    } else {
      audioPlayer.setReleaseMode(ReleaseMode.stop);
      await audioPlayer.stop();
    }
  }

  void gameStart(bool play) async {
    if (play) {
      audioPlayer.setReleaseMode(ReleaseMode.stop);
      await audioPlayer.setSource(AssetSource("audios/game_start.mp3"));
      await audioPlayer.resume();
    } else {
      await audioPlayer.stop();
    }
  }

  void selectMove(bool play) async {
    if (play) {
      audioPlayer.setReleaseMode(ReleaseMode.stop);
      await audioPlayer.setSource(AssetSource("audios/select_move.mp3"));
      await audioPlayer.resume();
    } else {
      await audioPlayer.stop();
    }
  }

  void playerWon(bool play) async {
    if (play) {
      audioPlayer.setReleaseMode(ReleaseMode.stop);
      await audioPlayer.setSource(AssetSource("audios/player_won.mp3"));
      await audioPlayer.resume();
    } else {
      await audioPlayer.stop();
    }
  }
}
