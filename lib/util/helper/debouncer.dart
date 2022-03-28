import 'dart:async';

import 'package:flutter/foundation.dart';

class DebounceHelper {
  final int milliseconds;
  Timer? _timer;

  DebounceHelper({required this.milliseconds});

  run(VoidCallback action) {
    if (_timer != null) {
      _timer?.cancel();
    }

    _timer = Timer(
      Duration(milliseconds: milliseconds),
      action,
    );
  }
}