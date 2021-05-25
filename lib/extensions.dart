import 'package:generate_unique_numbers/generate_unique_numbers.dart';

List<int> generateItemPositions({
  required int positionCount,
  required max,
}) =>
    generateUniqueNumbers(numberCount: positionCount, max: max);
