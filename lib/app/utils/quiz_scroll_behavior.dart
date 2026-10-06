import 'dart:ui' show PointerDeviceKind;
import 'package:flutter/material.dart';

class QuizScrollBehavior extends MaterialScrollBehavior {
  const QuizScrollBehavior();

  @override
  Set<PointerDeviceKind> get dragDevices => const {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
    PointerDeviceKind.stylus,
    PointerDeviceKind.trackpad,
    PointerDeviceKind.unknown,
  };
}
