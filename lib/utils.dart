import 'dart:math';

import 'package:flutter/material.dart';

List<int> generateItemPositions({@required int positionCount, @required max}) {
  final random = Random.secure();
  return List.generate(positionCount, (index) => random.nextInt(max));
}
