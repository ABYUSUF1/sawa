import 'dart:async';

class Throttler {
  final Duration delay;
  Timer? _timer;
  bool _isReady = true;

  Throttler({required this.delay});

  void call(Future<void> Function() action) {
    if (_isReady) {
      _isReady = false;
      action(); // async function
      _timer = Timer(delay, () {
        _isReady = true;
      });
    }
  }

  void dispose() {
    _timer?.cancel();
  }
}
