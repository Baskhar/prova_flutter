import 'package:vibration/vibration.dart';

class Vibrate{
  Future<void> vibrate() async {
    if (await Vibration.hasVibrator() ?? false) {
      Vibration.vibrate(duration: 500);
    }
  }

}