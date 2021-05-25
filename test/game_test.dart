import 'package:flutter_test/flutter_test.dart';
import 'package:gamx/utils.dart';

void main() {
  test("test generate position count", () async {
    expect(3, generateItemPositions(positionCount: 3, max: 1000).length);
    expect(30, generateItemPositions(positionCount: 30, max: 444).length);
    expect(10, generateItemPositions(positionCount: 10, max: 555).length);
    expect(300, generateItemPositions(positionCount: 300, max: 555).length);
    expect(
        3000, generateItemPositions(positionCount: 3000, max: 5555456).length);
  });

  test("test generate position count | run 1000", () async {
    for (int a = 0; a < 1000; a++) {
      expect(a, generateItemPositions(positionCount: a, max: a).length);
    }
  });

  test("test uniques | run 1000", () async {
    for (int a = 0; a < 1000; a++) {
      expect(5, generateItemPositions(positionCount: 8, max: 10).toSet().length);
    }
  });

  test("test generated positions type", () async {
    expect([true],
        generateItemPositions(positionCount: 1, max: 10).map((e) => e is int));
  });
}
