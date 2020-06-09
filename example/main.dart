import 'package:flutter_test/flutter_test.dart';
import 'package:masamune_test/masamune_test.dart';

void main() {
  test('String test', () {
    String sourceString = "test";
    sourceString.are("test");
  });
}
