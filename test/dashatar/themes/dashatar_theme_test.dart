// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:very_good_slide_puzzle/dashatar/coidon.dart';

import '../../helpers/helpers.dart';

void main() {
  group('CoidonTheme', () {
    group('ElephantCoidonTheme', () {
      test('supports value comparisons', () {
        expect(
          ElephantCoidonTheme(),
          equals(ElephantCoidonTheme()),
        );
      });

      test('uses DashatarPuzzleLayoutDelegate', () {
        expect(
          ElephantCoidonTheme().layoutDelegate,
          equals(DashatarPuzzleLayoutDelegate()),
        );
      });

      test('dashAssetForTile returns correct assets', () {
        final tile = MockTile();
        const tileValue = 6;
        when(() => tile.value).thenReturn(tileValue);
        expect(
          ElephantCoidonTheme().dashAssetForTile(tile),
          equals('assets/images/coidon/elephant/6.png'),
        );
      });
    });

    group('TigerCoidonTheme', () {
      test('supports value comparisons', () {
        expect(
          TigerCoidonTheme(),
          equals(TigerCoidonTheme()),
        );
      });

      test('uses DashatarPuzzleLayoutDelegate', () {
        expect(
          TigerCoidonTheme().layoutDelegate,
          equals(DashatarPuzzleLayoutDelegate()),
        );
      });

      test('dashAssetForTile returns correct assets', () {
        final tile = MockTile();
        const tileValue = 6;
        when(() => tile.value).thenReturn(tileValue);
        expect(
          TigerCoidonTheme().dashAssetForTile(tile),
          equals('assets/images/coidon/tiger/6.png'),
        );
      });
    });

    group('RedWolfCoidonTheme', () {
      test('supports value comparisons', () {
        expect(
          RedWolfCoidonTheme(),
          equals(RedWolfCoidonTheme()),
        );
      });

      test('uses DashatarPuzzleLayoutDelegate', () {
        expect(
          RedWolfCoidonTheme().layoutDelegate,
          equals(DashatarPuzzleLayoutDelegate()),
        );
      });

      test('dashAssetForTile returns correct assets', () {
        final tile = MockTile();
        const tileValue = 6;
        when(() => tile.value).thenReturn(tileValue);
        expect(
          RedWolfCoidonTheme().dashAssetForTile(tile),
          equals('assets/images/coidon/wolf/6.png'),
        );
      });
    });
  });
}
