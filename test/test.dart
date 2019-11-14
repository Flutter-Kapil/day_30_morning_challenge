import 'package:test/test.dart';
import '../bin/main.dart';

void main() {
  test("test case 1", () {
    expect(
        matryoshka([
          [2, 3, 9, 5],
          [10, 2, 1]
        ]),
        true);
    expect(
        matryoshka([
          [2, 3, 9, 5],
          [2, 2, 9]
        ]),
        false);
  });
}
