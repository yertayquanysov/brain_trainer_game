List<int> generateItemPositions({
  required int positionCount,
  required max,
}) {
  final numbers = List.generate(max, (index) => index + 1)..shuffle();

  return numbers.getRange(0, positionCount).toList();
}
