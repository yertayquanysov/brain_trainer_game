import 'package:flutter/material.dart';
import 'package:generate_unique_numbers/generate_unique_numbers.dart';

extension on List {
  List<int> generateItemPositions({
    required int positionCount,
    required max,
  }) =>
      generateUniqueNumbers(numberCount: positionCount, max: max);
}
