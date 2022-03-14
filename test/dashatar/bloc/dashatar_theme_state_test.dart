// ignore_for_file: prefer_const_constructors
import 'package:flutter_test/flutter_test.dart';
import 'package:very_good_slide_puzzle/dashatar/coidon.dart';

import '../../helpers/helpers.dart';

void main() {
  group('CoidonThemeState', () {
    test('supports value comparisons', () {
      final theme = MockCoidonTheme();
      final themes = [theme];

      expect(
        CoidonThemeState(themes: themes, theme: theme),
        equals(CoidonThemeState(themes: themes, theme: theme)),
      );

      expect(
        CoidonThemeState(themes: themes, theme: theme),
        isNot(CoidonThemeState(themes: themes, theme: MockCoidonTheme())),
      );
    });

    test('default theme is TigerCoidonTheme', () {
      expect(
        CoidonThemeState(themes: [MockCoidonTheme()]).theme,
        equals(TigerCoidonTheme()),
      );
    });

    group('copyWith', () {
      test('updates themes', () {
        final themesA = [TigerCoidonTheme()];
        final themesB = [ElephantCoidonTheme()];
        expect(
          CoidonThemeState(
            themes: themesA,
          ).copyWith(themes: themesB),
          equals(
            CoidonThemeState(
              themes: themesB,
            ),
          ),
        );
      });

      test('updates theme', () {
        final themes = [TigerCoidonTheme(), ElephantCoidonTheme()];
        final themeA = TigerCoidonTheme();
        final themeB = ElephantCoidonTheme();

        expect(
          CoidonThemeState(
            themes: themes,
            theme: themeA,
          ).copyWith(theme: themeB),
          equals(
            CoidonThemeState(
              themes: themes,
              theme: themeB,
            ),
          ),
        );
      });
    });
  });
}
