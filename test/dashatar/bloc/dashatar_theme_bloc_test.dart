// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:very_good_slide_puzzle/dashatar/coidon.dart';

import '../../helpers/helpers.dart';

void main() {
  group('CoidonThemeBloc', () {
    test('initial state is correct', () {
      final themes = [MockCoidonTheme()];

      expect(
        CoidonThemeBloc(themes: themes).state,
        equals(
          CoidonThemeState(themes: themes),
        ),
      );
    });

    group('CoidonThemeChanged', () {
      late CoidonTheme theme;
      late List<CoidonTheme> themes;

      blocTest<CoidonThemeBloc, CoidonThemeState>(
        'emits new theme',
        setUp: () {
          theme = MockCoidonTheme();
          themes = [MockCoidonTheme(), theme];
        },
        build: () => CoidonThemeBloc(themes: themes),
        act: (bloc) => bloc.add(CoidonThemeChanged(themeIndex: 1)),
        expect: () => <CoidonThemeState>[
          CoidonThemeState(themes: themes, theme: theme),
        ],
      );
    });
  });
}
