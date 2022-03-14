// ignore_for_file: prefer_const_constructors, avoid_redundant_argument_values

import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:very_good_slide_puzzle/audio_control/audio_control.dart';
import 'package:very_good_slide_puzzle/dashatar/coidon.dart';
import 'package:very_good_slide_puzzle/puzzle/puzzle.dart';

import '../../helpers/helpers.dart';

void main() {
  group('DashatarCountdown', () {
    late DashatarPuzzleBloc dashatarPuzzleBloc;
    late CoidonThemeBloc coidonThemeBloc;
    late AudioControlBloc audioControlBloc;

    setUp(() {
      dashatarPuzzleBloc = MockDashatarPuzzleBloc();
      final dashatarPuzzleState = DashatarPuzzleState(secondsToBegin: 3);
      whenListen(
        dashatarPuzzleBloc,
        Stream.value(dashatarPuzzleState),
        initialState: dashatarPuzzleState,
      );

      coidonThemeBloc = MockCoidonThemeBloc();
      final themes = [TigerCoidonTheme()];
      final coidonThemeState = CoidonThemeState(themes: themes);
      whenListen(
        coidonThemeBloc,
        Stream.value(coidonThemeState),
        initialState: coidonThemeState,
      );

      audioControlBloc = MockAudioControlBloc();
      when(() => audioControlBloc.state).thenReturn(AudioControlState());
    });

    testWidgets(
        'adds PuzzleReset to PuzzleBloc '
        'when isCountdownRunning is true and '
        'secondsToBegin is between 1 and 3 (inclusive)', (tester) async {
      final puzzleBloc = MockPuzzleBloc();

      final state = DashatarPuzzleState(
        isCountdownRunning: true,
        secondsToBegin: 4,
      );

      final streamController = StreamController<DashatarPuzzleState>();

      whenListen(
        dashatarPuzzleBloc,
        streamController.stream,
      );

      streamController
        ..add(state)
        ..add(state.copyWith(secondsToBegin: 3))
        ..add(state.copyWith(secondsToBegin: 2))
        ..add(state.copyWith(secondsToBegin: 1))
        ..add(state.copyWith(secondsToBegin: 0))
        ..add(state.copyWith(isCountdownRunning: false));

      await tester.pumpApp(
        DashatarCountdown(),
        dashatarPuzzleBloc: dashatarPuzzleBloc,
        coidonThemeBloc: coidonThemeBloc,
        puzzleBloc: puzzleBloc,
        audioControlBloc: audioControlBloc,
      );

      verify(() => puzzleBloc.add(PuzzleReset())).called(3);
    });

    testWidgets(
        'plays the shuffle sound '
        'when secondsToBegin is 3', (tester) async {
      final audioPlayer = MockAudioPlayer();
      when(() => audioPlayer.setAsset(any())).thenAnswer((_) async => null);
      when(() => audioPlayer.seek(any())).thenAnswer((_) async {});
      when(() => audioPlayer.setVolume(any())).thenAnswer((_) async {});
      when(audioPlayer.play).thenAnswer((_) async {});
      when(audioPlayer.stop).thenAnswer((_) async {});
      when(audioPlayer.dispose).thenAnswer((_) async {});

      final state = DashatarPuzzleState(
        isCountdownRunning: true,
        secondsToBegin: 3,
      );

      whenListen(
        dashatarPuzzleBloc,
        Stream.value(state),
        initialState: state,
      );

      await tester.pumpApp(
        DashatarCountdown(
          audioPlayer: () => audioPlayer,
        ),
        dashatarPuzzleBloc: dashatarPuzzleBloc,
        coidonThemeBloc: coidonThemeBloc,
        audioControlBloc: audioControlBloc,
      );

      verify(() => audioPlayer.setAsset('assets/audio/shuffle.mp3')).called(1);
      verify(audioPlayer.play).called(1);
    });

    group('on a large display', () {
      testWidgets(
          'renders DashatarCountdownSecondsToBegin '
          'if isCountdownRunning is true and '
          'secondsToBegin is greater than 0', (tester) async {
        tester.setLargeDisplaySize();

        final state = DashatarPuzzleState(
          isCountdownRunning: true,
          secondsToBegin: 3,
        );

        whenListen(
          dashatarPuzzleBloc,
          Stream.value(state),
          initialState: state,
        );

        await tester.pumpApp(
          DashatarCountdown(),
          dashatarPuzzleBloc: dashatarPuzzleBloc,
          coidonThemeBloc: coidonThemeBloc,
          audioControlBloc: audioControlBloc,
        );

        expect(
          find.byWidgetPredicate(
            (widget) =>
                widget is DashatarCountdownSecondsToBegin &&
                widget.secondsToBegin == state.secondsToBegin,
          ),
          findsOneWidget,
        );

        expect(find.byType(DashatarCountdownGo), findsNothing);
      });

      testWidgets(
          'renders DashatarCountdownGo '
          'if isCountdownRunning is true and '
          'secondsToBegin is equal to 0', (tester) async {
        tester.setLargeDisplaySize();

        final state = DashatarPuzzleState(
          isCountdownRunning: true,
          secondsToBegin: 0,
        );

        whenListen(
          dashatarPuzzleBloc,
          Stream.value(state),
          initialState: state,
        );

        await tester.pumpApp(
          DashatarCountdown(),
          dashatarPuzzleBloc: dashatarPuzzleBloc,
          coidonThemeBloc: coidonThemeBloc,
          audioControlBloc: audioControlBloc,
        );

        expect(find.byType(DashatarCountdownSecondsToBegin), findsNothing);
        expect(find.byType(DashatarCountdownGo), findsOneWidget);
      });

      testWidgets(
          'renders SizedBox '
          'if isCountdownRunning is false', (tester) async {
        tester.setLargeDisplaySize();

        final state = DashatarPuzzleState(
          isCountdownRunning: false,
          secondsToBegin: 3,
        );

        whenListen(
          dashatarPuzzleBloc,
          Stream.value(state),
          initialState: state,
        );

        await tester.pumpApp(
          DashatarCountdown(),
          dashatarPuzzleBloc: dashatarPuzzleBloc,
          coidonThemeBloc: coidonThemeBloc,
          audioControlBloc: audioControlBloc,
        );

        expect(find.byType(SizedBox), findsOneWidget);
        expect(find.byType(DashatarCountdownSecondsToBegin), findsNothing);
        expect(find.byType(DashatarCountdownGo), findsNothing);
      });

      testWidgets(
          'renders SizedBox '
          'if secondsToBegin is greater than 3', (tester) async {
        tester.setLargeDisplaySize();

        final state = DashatarPuzzleState(
          isCountdownRunning: true,
          secondsToBegin: 4,
        );

        whenListen(
          dashatarPuzzleBloc,
          Stream.value(state),
          initialState: state,
        );

        await tester.pumpApp(
          DashatarCountdown(),
          dashatarPuzzleBloc: dashatarPuzzleBloc,
          coidonThemeBloc: coidonThemeBloc,
          audioControlBloc: audioControlBloc,
        );

        expect(find.byType(SizedBox), findsOneWidget);
        expect(find.byType(DashatarCountdownSecondsToBegin), findsNothing);
        expect(find.byType(DashatarCountdownGo), findsNothing);
      });
    });

    testWidgets('renders SizedBox on a medium display', (tester) async {
      tester.setMediumDisplaySize();

      await tester.pumpApp(
        DashatarCountdown(),
        dashatarPuzzleBloc: dashatarPuzzleBloc,
        audioControlBloc: audioControlBloc,
      );

      expect(find.byType(SizedBox), findsOneWidget);
      expect(find.byType(DashatarCountdownSecondsToBegin), findsNothing);
      expect(find.byType(DashatarCountdownGo), findsNothing);
    });

    testWidgets('renders SizedBox on a small display', (tester) async {
      tester.setSmallDisplaySize();

      await tester.pumpApp(
        DashatarCountdown(),
        dashatarPuzzleBloc: dashatarPuzzleBloc,
        audioControlBloc: audioControlBloc,
      );

      expect(find.byType(SizedBox), findsOneWidget);
      expect(find.byType(DashatarCountdownSecondsToBegin), findsNothing);
      expect(find.byType(DashatarCountdownGo), findsNothing);
    });

    testWidgets('renders AudioControlListener', (tester) async {
      await tester.pumpApp(
        DashatarCountdown(),
        dashatarPuzzleBloc: dashatarPuzzleBloc,
        audioControlBloc: audioControlBloc,
      );

      expect(find.byType(AudioControlListener), findsOneWidget);
    });
  });

  group('DashatarCountdownSecondsToBegin', () {
    late CoidonThemeBloc coidonThemeBloc;
    late CoidonTheme coidonTheme;

    setUp(() {
      coidonThemeBloc = MockCoidonThemeBloc();
      coidonTheme = MockCoidonTheme();
      final coidonThemeState = CoidonThemeState(
        themes: [coidonTheme],
        theme: coidonTheme,
      );

      when(() => coidonTheme.defaultColor).thenReturn(Colors.black);
      when(() => coidonTheme.countdownColor).thenReturn(Colors.black);
      when(() => coidonThemeBloc.state).thenReturn(coidonThemeState);
    });

    testWidgets(
        'renders secondsToBegin '
        'using CoidonTheme.countdownColor as text color', (tester) async {
      const countdownColor = Colors.green;
      when(() => coidonTheme.countdownColor).thenReturn(countdownColor);

      await tester.pumpApp(
        DashatarCountdownSecondsToBegin(
          secondsToBegin: 3,
        ),
        coidonThemeBloc: coidonThemeBloc,
      );

      final text = tester.widget<Text>(find.text('3'));

      expect(text.style?.color, equals(countdownColor));
    });
  });

  group('DashatarCountdownGo', () {
    late CoidonThemeBloc coidonThemeBloc;
    late CoidonTheme coidonTheme;

    setUp(() {
      coidonThemeBloc = MockCoidonThemeBloc();
      coidonTheme = MockCoidonTheme();
      final themeState = CoidonThemeState(
        themes: [coidonTheme],
        theme: coidonTheme,
      );

      when(() => coidonTheme.defaultColor).thenReturn(Colors.black);
      when(() => coidonTheme.countdownColor).thenReturn(Colors.black);
      when(() => coidonThemeBloc.state).thenReturn(themeState);
    });

    testWidgets(
        'renders text '
        'using CoidonTheme.defaultColor as text color', (tester) async {
      const defaultColor = Colors.orange;
      when(() => coidonTheme.defaultColor).thenReturn(defaultColor);

      await tester.pumpApp(
        DashatarCountdownGo(),
        coidonThemeBloc: coidonThemeBloc,
      );

      final text = tester.widget<Text>(find.byType(Text));

      expect(text.style?.color, equals(defaultColor));
    });
  });
}
