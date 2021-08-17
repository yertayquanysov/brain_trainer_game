import 'package:flutter_test/flutter_test.dart';
import 'package:gamx/extensions.dart';

void main() {
  test("test generate position count", () async {
    expect(3, generateItemPositions(positionCount: 3, max: 1000).length);
    expect(30, generateItemPositions(positionCount: 30, max: 444).length);
    expect(10, generateItemPositions(positionCount: 10, max: 555).length);
    expect(300, generateItemPositions(positionCount: 300, max: 555).length);
  });
}
