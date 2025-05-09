import 'dart:async';

import 'package:flutter/material.dart';

class CustomDeBouncer {
  final int milliseconds;
  VoidCallback? action;
  Timer? _timer;

  CustomDeBouncer({required this.milliseconds});

  run(VoidCallback action) {
    _timer?.cancel();
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}
