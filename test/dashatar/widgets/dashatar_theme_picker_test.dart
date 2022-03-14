// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:very_good_slide_puzzle/audio_control/audio_control.dart';
import 'package:very_good_slide_puzzle/dashatar/coidon.dart';

import '../../helpers/helpers.dart';

void main() {
  group('CoidonThemePicker', () {
    late CoidonThemeBloc coidonThemeBloc;
    late CoidonTheme coidonTheme;
    late List<CoidonTheme> coidonThemes;
    late AudioControlBloc audioControlBloc;

    setUp(() {
      coidonThemeBloc = MockCoidonThemeBloc();
      coidonThemes = [
        TigerCoidonTheme(),
        RedWolfCoidonTheme(),
        ElephantCoidonTheme()
      ];
      coidonTheme = TigerCoidonTheme();
      final coidonThemeState = CoidonThemeState(
        themes: coidonThemes,
        theme: coidonTheme,
      );

      when(() => coidonThemeBloc.state).thenReturn(coidonThemeState);

      audioControlBloc = MockAudioControlBloc();
      when(() => audioControlBloc.state).thenReturn(AudioControlState());
    });

    testWidgets('renders on a large display', (tester) async {
      tester.setLargeDisplaySize();

      await tester.pumpApp(
        CoidonThemePicker(),
        coidonThemeBloc: coidonThemeBloc,
        audioControlBloc: audioControlBloc,
      );

      expect(
        find.byKey(Key('dashatar_theme_picker')),
        findsOneWidget,
      );
    });

    testWidgets('renders on a medium display', (tester) async {
      tester.setMediumDisplaySize();

      await tester.pumpApp(
        CoidonThemePicker(),
        coidonThemeBloc: coidonThemeBloc,
        audioControlBloc: audioControlBloc,
      );

      expect(
        find.byKey(Key('dashatar_theme_picker')),
        findsOneWidget,
      );
    });

    testWidgets('renders on a small display', (tester) async {
      tester.setSmallDisplaySize();

      await tester.pumpApp(
        CoidonThemePicker(),
        coidonThemeBloc: coidonThemeBloc,
        audioControlBloc: audioControlBloc,
      );

      expect(
        find.byKey(Key('dashatar_theme_picker')),
        findsOneWidget,
      );
    });

    testWidgets(
        'renders Image with a theme asset '
        'for each Dashatar theme', (tester) async {
      await tester.pumpApp(
        CoidonThemePicker(),
        coidonThemeBloc: coidonThemeBloc,
        audioControlBloc: audioControlBloc,
      );

      for (final coidonTheme in coidonThemes) {
        expect(
          find.byWidgetPredicate(
            (widget) =>
                widget is Image &&
                (widget.image as AssetImage).assetName ==
                    coidonTheme.themeAsset,
          ),
          findsOneWidget,
        );
      }
    });

    testWidgets('renders AudioControlListener', (tester) async {
      await tester.pumpApp(
        CoidonThemePicker(),
        coidonThemeBloc: coidonThemeBloc,
        audioControlBloc: audioControlBloc,
      );

      expect(find.byType(AudioControlListener), findsOneWidget);
    });

    testWidgets(
        'each Image has semanticLabel '
        'from CoidonTheme.semanticsLabel', (tester) async {
      await tester.pumpApp(
        CoidonThemePicker(),
        coidonThemeBloc: coidonThemeBloc,
        audioControlBloc: audioControlBloc,
      );

      final BuildContext context =
          tester.element(find.byType(CoidonThemePicker));

      for (final coidonTheme in coidonThemes) {
        expect(
          find.byWidgetPredicate(
            (widget) =>
                widget is Image &&
                widget.semanticLabel == coidonTheme.semanticsLabel(context),
          ),
          findsOneWidget,
        );
      }
    });

    testWidgets(
        'adds CoidonThemeChanged to CoidonThemeBloc '
        'when tapped', (tester) async {
      await tester.pumpApp(
        CoidonThemePicker(),
        coidonThemeBloc: coidonThemeBloc,
        audioControlBloc: audioControlBloc,
      );

      final index = coidonThemes.indexOf(RedWolfCoidonTheme());

      await tester.tap(find.byKey(Key('dashatar_theme_picker_$index')));

      verify(
        () => coidonThemeBloc.add(CoidonThemeChanged(themeIndex: index)),
      ).called(1);
    });

    testWidgets(
        'plays CoidonTheme.audioAsset sound '
        'when tapped', (tester) async {
      final audioPlayer = MockAudioPlayer();
      when(() => audioPlayer.setAsset(any())).thenAnswer((_) async => null);
      when(() => audioPlayer.seek(any())).thenAnswer((_) async {});
      when(() => audioPlayer.setVolume(any())).thenAnswer((_) async {});
      when(audioPlayer.play).thenAnswer((_) async {});
      when(audioPlayer.stop).thenAnswer((_) async {});
      when(audioPlayer.dispose).thenAnswer((_) async {});

      await tester.pumpApp(
        CoidonThemePicker(
          audioPlayer: () => audioPlayer,
        ),
        coidonThemeBloc: coidonThemeBloc,
        audioControlBloc: audioControlBloc,
      );

      final theme = RedWolfCoidonTheme();
      final index = coidonThemes.indexOf(theme);

      await tester.tap(find.byKey(Key('dashatar_theme_picker_$index')));

      verify(() => audioPlayer.setAsset(theme.audioAsset)).called(1);
      verify(audioPlayer.play).called(1);
    });
  });
}
