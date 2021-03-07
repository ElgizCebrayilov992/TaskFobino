import 'dart:math';

import 'package:flutter/material.dart';

class ColorGenerator {
  Color randomCcolors() {
    return Color.fromARGB(
        (Random().nextInt(155) + 100),
        (Random().nextInt(155) + 100),
        (Random().nextInt(155) + 100),
        (Random().nextInt(155) + 100));
  }
}
