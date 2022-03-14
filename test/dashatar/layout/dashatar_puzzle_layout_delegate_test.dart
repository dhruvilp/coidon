// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:very_good_slide_puzzle/audio_control/audio_control.dart';
import 'package:very_good_slide_puzzle/dashatar/coidon.dart';
import 'package:very_good_slide_puzzle/models/models.dart';
import 'package:very_good_slide_puzzle/puzzle/puzzle.dart';
import 'package:very_good_slide_puzzle/theme/theme.dart';
import 'package:very_good_slide_puzzle/timer/timer.dart';

import '../../helpers/helpers.dart';

void main() {
  group('DashatarPuzzleLayoutDelegate', () {
    late DashatarPuzzleLayoutDelegate layoutDelegate;
    late DashatarPuzzleBloc dashatarPuzzleBloc;
    late CoidonThemeBloc coidonThemeBloc;
    late ThemeBloc themeBloc;
    late PuzzleBloc puzzleBloc;
    late PuzzleState state;
    late TimerBloc timerBloc;
    late AudioControlBloc audioControlBloc;

    setUp(() {
      layoutDelegate = DashatarPuzzleLayoutDelegate();

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

      themeBloc = MockThemeBloc();
      final theme = TigerCoidonTheme();
      final themeState = ThemeState(themes: [theme], theme: theme);
      when(() => themeBloc.state).thenReturn(themeState);

      puzzleBloc = MockPuzzleBloc();
      state = PuzzleState();
      when(() => puzzleBloc.state).thenReturn(state);

      timerBloc = MockTimerBloc();
      when(() => timerBloc.state).thenReturn(TimerState());

      audioControlBloc = MockAudioControlBloc();
      when(() => audioControlBloc.state).thenReturn(AudioControlState());
    });

    group('startSectionBuilder', () {
      testWidgets(
          'renders DashatarStartSection '
          'on a large display', (tester) async {
        tester.setLargeDisplaySize();

        await tester.pumpApp(
          SingleChildScrollView(
            child: layoutDelegate.startSectionBuilder(state),
          ),
          dashatarPuzzleBloc: dashatarPuzzleBloc,
          coidonThemeBloc: coidonThemeBloc,
          puzzleBloc: puzzleBloc,
          themeBloc: themeBloc,
          timerBloc: timerBloc,
          audioControlBloc: audioControlBloc,
        );

        expect(
          find.byWidgetPredicate(
            (widget) => widget is DashatarStartSection && widget.state == state,
          ),
          findsOneWidget,
        );
      });

      testWidgets(
          'renders DashatarStartSection '
          'on a medium display', (tester) async {
        tester.setMediumDisplaySize();

        await tester.pumpApp(
          SingleChildScrollView(
            child: layoutDelegate.startSectionBuilder(state),
          ),
          dashatarPuzzleBloc: dashatarPuzzleBloc,
          coidonThemeBloc: coidonThemeBloc,
          puzzleBloc: puzzleBloc,
          themeBloc: themeBloc,
          timerBloc: timerBloc,
          audioControlBloc: audioControlBloc,
        );

        expect(
          find.byWidgetPredicate(
            (widget) => widget is DashatarStartSection && widget.state == state,
          ),
          findsOneWidget,
        );
      });

      testWidgets(
          'renders DashatarStartSection '
          'on a small display', (tester) async {
        tester.setSmallDisplaySize();

        await tester.pumpApp(
          SingleChildScrollView(
            child: layoutDelegate.startSectionBuilder(state),
          ),
          dashatarPuzzleBloc: dashatarPuzzleBloc,
          coidonThemeBloc: coidonThemeBloc,
          puzzleBloc: puzzleBloc,
          themeBloc: themeBloc,
          timerBloc: timerBloc,
          audioControlBloc: audioControlBloc,
        );

        expect(
          find.byWidgetPredicate(
            (widget) => widget is DashatarStartSection && widget.state == state,
          ),
          findsOneWidget,
        );
      });
    });

    group('endSectionBuilder', () {
      group('on a large display', () {
        testWidgets(
            'does not render DashatarPuzzleActionButton and '
            'CoidonThemePicker', (tester) async {
          tester.setLargeDisplaySize();

          await tester.pumpApp(
            SingleChildScrollView(
              child: layoutDelegate.endSectionBuilder(state),
            ),
            dashatarPuzzleBloc: dashatarPuzzleBloc,
            coidonThemeBloc: coidonThemeBloc,
            puzzleBloc: puzzleBloc,
            themeBloc: themeBloc,
            timerBloc: timerBloc,
            audioControlBloc: audioControlBloc,
          );

          expect(find.byType(DashatarPuzzleActionButton), findsNothing);
          expect(find.byType(CoidonThemePicker), findsNothing);
        });

        testWidgets('renders DashatarCountdown', (tester) async {
          tester.setLargeDisplaySize();

          await tester.pumpApp(
            SingleChildScrollView(
              child: layoutDelegate.endSectionBuilder(state),
            ),
            dashatarPuzzleBloc: dashatarPuzzleBloc,
            coidonThemeBloc: coidonThemeBloc,
            puzzleBloc: puzzleBloc,
            themeBloc: themeBloc,
            timerBloc: timerBloc,
            audioControlBloc: audioControlBloc,
          );

          expect(find.byType(DashatarCountdown), findsOneWidget);
        });
      });

      group('on a medium display', () {
        testWidgets('renders DashatarPuzzleActionButton', (tester) async {
          tester.setMediumDisplaySize();

          await tester.pumpApp(
            SingleChildScrollView(
              child: layoutDelegate.endSectionBuilder(state),
            ),
            dashatarPuzzleBloc: dashatarPuzzleBloc,
            coidonThemeBloc: coidonThemeBloc,
            puzzleBloc: puzzleBloc,
            themeBloc: themeBloc,
            timerBloc: timerBloc,
            audioControlBloc: audioControlBloc,
          );

          expect(find.byType(DashatarPuzzleActionButton), findsOneWidget);
        });

        testWidgets('renders CoidonThemePicker', (tester) async {
          tester.setMediumDisplaySize();

          await tester.pumpApp(
            SingleChildScrollView(
              child: layoutDelegate.endSectionBuilder(state),
            ),
            dashatarPuzzleBloc: dashatarPuzzleBloc,
            coidonThemeBloc: coidonThemeBloc,
            puzzleBloc: puzzleBloc,
            themeBloc: themeBloc,
            timerBloc: timerBloc,
            audioControlBloc: audioControlBloc,
          );

          expect(find.byType(CoidonThemePicker), findsOneWidget);
        });

        testWidgets('renders DashatarCountdown', (tester) async {
          tester.setMediumDisplaySize();

          await tester.pumpApp(
            SingleChildScrollView(
              child: layoutDelegate.endSectionBuilder(state),
            ),
            dashatarPuzzleBloc: dashatarPuzzleBloc,
            coidonThemeBloc: coidonThemeBloc,
            puzzleBloc: puzzleBloc,
            themeBloc: themeBloc,
            timerBloc: timerBloc,
            audioControlBloc: audioControlBloc,
          );

          expect(find.byType(DashatarCountdown), findsOneWidget);
        });
      });

      group('on a small display', () {
        testWidgets('renders DashatarPuzzleActionButton', (tester) async {
          tester.setSmallDisplaySize();

          await tester.pumpApp(
            SingleChildScrollView(
              child: layoutDelegate.endSectionBuilder(state),
            ),
            dashatarPuzzleBloc: dashatarPuzzleBloc,
            coidonThemeBloc: coidonThemeBloc,
            puzzleBloc: puzzleBloc,
            themeBloc: themeBloc,
            timerBloc: timerBloc,
            audioControlBloc: audioControlBloc,
          );

          expect(find.byType(DashatarPuzzleActionButton), findsOneWidget);
        });

        testWidgets('renders CoidonThemePicker', (tester) async {
          tester.setSmallDisplaySize();

          await tester.pumpApp(
            SingleChildScrollView(
              child: layoutDelegate.endSectionBuilder(state),
            ),
            dashatarPuzzleBloc: dashatarPuzzleBloc,
            coidonThemeBloc: coidonThemeBloc,
            puzzleBloc: puzzleBloc,
            themeBloc: themeBloc,
            timerBloc: timerBloc,
            audioControlBloc: audioControlBloc,
          );

          expect(find.byType(CoidonThemePicker), findsOneWidget);
        });

        testWidgets('renders DashatarCountdown', (tester) async {
          tester.setSmallDisplaySize();

          await tester.pumpApp(
            SingleChildScrollView(
              child: layoutDelegate.endSectionBuilder(state),
            ),
            dashatarPuzzleBloc: dashatarPuzzleBloc,
            coidonThemeBloc: coidonThemeBloc,
            puzzleBloc: puzzleBloc,
            themeBloc: themeBloc,
            timerBloc: timerBloc,
            audioControlBloc: audioControlBloc,
          );

          expect(find.byType(DashatarCountdown), findsOneWidget);
        });
      });
    });

    group('backgroundBuilder', () {
      testWidgets(
          'renders CoidonThemePicker '
          'on a large display', (tester) async {
        tester.setLargeDisplaySize();

        await tester.pumpApp(
          Stack(
            children: [
              layoutDelegate.backgroundBuilder(state),
            ],
          ),
          dashatarPuzzleBloc: dashatarPuzzleBloc,
          coidonThemeBloc: coidonThemeBloc,
          puzzleBloc: puzzleBloc,
          themeBloc: themeBloc,
          timerBloc: timerBloc,
          audioControlBloc: audioControlBloc,
        );

        expect(find.byType(CoidonThemePicker), findsOneWidget);
      });

      testWidgets(
          'renders SizedBox '
          'on a medium display', (tester) async {
        tester.setMediumDisplaySize();

        await tester.pumpApp(
          Stack(
            children: [
              layoutDelegate.backgroundBuilder(state),
            ],
          ),
          dashatarPuzzleBloc: dashatarPuzzleBloc,
          coidonThemeBloc: coidonThemeBloc,
          puzzleBloc: puzzleBloc,
          themeBloc: themeBloc,
          timerBloc: timerBloc,
          audioControlBloc: audioControlBloc,
        );

        expect(find.byType(CoidonThemePicker), findsNothing);
        expect(find.byType(SizedBox), findsOneWidget);
      });

      testWidgets(
          'renders SizedBox '
          'on a small display', (tester) async {
        tester.setSmallDisplaySize();

        await tester.pumpApp(
          Stack(
            children: [
              layoutDelegate.backgroundBuilder(state),
            ],
          ),
          dashatarPuzzleBloc: dashatarPuzzleBloc,
          coidonThemeBloc: coidonThemeBloc,
          puzzleBloc: puzzleBloc,
          themeBloc: themeBloc,
          timerBloc: timerBloc,
          audioControlBloc: audioControlBloc,
        );

        expect(find.byType(CoidonThemePicker), findsNothing);
        expect(find.byType(SizedBox), findsOneWidget);
      });
    });

    group('boardBuilder', () {
      final tiles = [
        const SizedBox(),
      ];

      testWidgets(
          'renders DashatarTimer and DashatarPuzzleBoard '
          'on a large display', (tester) async {
        tester.setLargeDisplaySize();

        await tester.pumpApp(
          SingleChildScrollView(
            child: layoutDelegate.boardBuilder(4, tiles),
          ),
          dashatarPuzzleBloc: dashatarPuzzleBloc,
          coidonThemeBloc: coidonThemeBloc,
          puzzleBloc: puzzleBloc,
          themeBloc: themeBloc,
          timerBloc: timerBloc,
          audioControlBloc: audioControlBloc,
        );

        expect(find.byType(DashatarTimer), findsOneWidget);
        expect(
          find.byWidgetPredicate(
            (widget) => widget is DashatarPuzzleBoard && widget.tiles == tiles,
          ),
          findsOneWidget,
        );
      });

      testWidgets(
          'renders DashatarPuzzleBoard '
          'on a medium display', (tester) async {
        tester.setMediumDisplaySize();

        await tester.pumpApp(
          SingleChildScrollView(
            child: layoutDelegate.boardBuilder(4, tiles),
          ),
          dashatarPuzzleBloc: dashatarPuzzleBloc,
          coidonThemeBloc: coidonThemeBloc,
          puzzleBloc: puzzleBloc,
          themeBloc: themeBloc,
          timerBloc: timerBloc,
          audioControlBloc: audioControlBloc,
        );

        expect(find.byType(DashatarTimer), findsNothing);
        expect(
          find.byWidgetPredicate(
            (widget) => widget is DashatarPuzzleBoard && widget.tiles == tiles,
          ),
          findsOneWidget,
        );
      });

      testWidgets(
          'renders DashatarPuzzleBoard '
          'on a small display', (tester) async {
        tester.setSmallDisplaySize();

        await tester.pumpApp(
          SingleChildScrollView(
            child: layoutDelegate.boardBuilder(4, tiles),
          ),
          dashatarPuzzleBloc: dashatarPuzzleBloc,
          coidonThemeBloc: coidonThemeBloc,
          puzzleBloc: puzzleBloc,
          themeBloc: themeBloc,
          timerBloc: timerBloc,
          audioControlBloc: audioControlBloc,
        );

        expect(find.byType(DashatarTimer), findsNothing);
        expect(
          find.byWidgetPredicate(
            (widget) => widget is DashatarPuzzleBoard && widget.tiles == tiles,
          ),
          findsOneWidget,
        );
      });
    });

    group('tileBuilder', () {
      testWidgets('renders DashatarPuzzleTile', (tester) async {
        final tile = Tile(
          value: 1,
          correctPosition: Position(x: 1, y: 1),
          currentPosition: Position(x: 1, y: 2),
        );

        await tester.pumpApp(
          Material(
            child: layoutDelegate.tileBuilder(tile, state),
          ),
          dashatarPuzzleBloc: dashatarPuzzleBloc,
          coidonThemeBloc: coidonThemeBloc,
          puzzleBloc: puzzleBloc,
          themeBloc: themeBloc,
          timerBloc: timerBloc,
          audioControlBloc: audioControlBloc,
        );

        expect(
          find.byWidgetPredicate(
            (widget) =>
                widget is DashatarPuzzleTile &&
                widget.tile == tile &&
                widget.state == state,
          ),
          findsOneWidget,
        );
      });
    });

    group('whitespaceTileBuilder', () {
      testWidgets('renders SizedBox', (tester) async {
        await tester.pumpApp(
          layoutDelegate.whitespaceTileBuilder(),
        );

        expect(
          find.byType(SizedBox),
          findsOneWidget,
        );
      });
    });

    test('supports value comparisons', () {
      expect(
        DashatarPuzzleLayoutDelegate(),
        equals(DashatarPuzzleLayoutDelegate()),
      );
    });
  });
}
