// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:very_good_slide_puzzle/dashatar/coidon.dart';

void main() {
  group('CoidonThemeEvent', () {
    group('CoidonThemeChanged', () {
      test('supports value comparisons', () {
        expect(
          CoidonThemeChanged(themeIndex: 1),
          equals(CoidonThemeChanged(themeIndex: 1)),
        );
        expect(
          CoidonThemeChanged(themeIndex: 2),
          isNot(CoidonThemeChanged(themeIndex: 1)),
        );
      });
    });
  });
}
