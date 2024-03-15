import 'dart:async';

class TimerController {
  late Timer _timer;
  Duration? _duration;
  late Function(Duration)? _callback;

  void start([Duration? duration, Function(Duration)? callback]) {
    _duration = duration;
    _callback = callback;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if ((_duration?.inSeconds ?? 0) > 0) {
        _duration = _duration! - const Duration(seconds: 1);
        _callback!(_duration!);
      } else {
        _timer.cancel();
      }
    });
  }

  void pause() {
    _timer.cancel();
  }

  void dispose() {
    _timer.cancel();
  }
}
