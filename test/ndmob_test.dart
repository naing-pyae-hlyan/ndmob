import 'package:flutter_test/flutter_test.dart';
import 'package:ndmob/ndmob.dart';

void main() {
  test('adds one to input values', () {
    expect(Ndmob.adBanner(), 1);
    expect(Ndmob.adNative(), 2);
  });
}
