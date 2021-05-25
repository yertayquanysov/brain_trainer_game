
import 'package:flutter/material.dart';
import 'package:generate_unique_integers/generate_unique_integers.dart';

List<int> generateItemPositions({@required int positionCount, @required max}) {
  return generateUniqueNumbers(numberCount: positionCount, max: max);
}
