import 'package:just_audio/just_audio.dart';

class PlaySound {
  static void correctAnswer() async {
    AudioPlayer player = AudioPlayer();
    await player.setAsset('assets/sounds/correct_answer.mp3');
    await player.play();
    await player.dispose();
  }

  static void wrongAnswer() async {
    AudioPlayer player = AudioPlayer();
    await player.setAsset('assets/sounds/wrong_answer.mp3');
    await player.play();
    await player.dispose();
  }
}
