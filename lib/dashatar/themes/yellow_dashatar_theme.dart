import 'package:flutter/material.dart';
import 'package:very_good_slide_puzzle/colors/colors.dart';
import 'package:very_good_slide_puzzle/dashatar/coidon.dart';
import 'package:very_good_slide_puzzle/l10n/l10n.dart';

/// {@template yellow_dashatar_theme}
/// The yellow dashatar puzzle theme.
/// {@endtemplate}
class RedWolfCoidonTheme extends CoidonTheme {
  /// {@macro yellow_dashatar_theme}
  const RedWolfCoidonTheme() : super();

  @override
  String semanticsLabel(BuildContext context) =>
      context.l10n.coidonWolfLabelText;

  @override
  Color get backgroundColor => PuzzleColors.black;

  @override
  Color get defaultColor => PuzzleColors.yellow90;

  @override
  Color get buttonColor => PuzzleColors.yellow50;

  @override
  Color get menuInactiveColor => PuzzleColors.yellow50;

  @override
  Color get countdownColor => PuzzleColors.yellow50;

  @override
  String get themeAsset => 'assets/images/coidon/gallery/wolf.png';

  @override
  String get successThemeAsset => 'assets/images/coidon/success/yellow.png';

  @override
  String get audioControlOffAsset =>
      'assets/images/audio_control/yellow_dashatar_off.png';

  @override
  String get audioAsset => 'assets/audio/sandwich.mp3';

  @override
  String get dashAssetsDirectory => 'assets/images/coidon/wolf';

  @override
  String get name => 'Red Wolf';

  @override
  String get status => 'CR';

  @override
  String get scientificName => 'Canis rufus';
}
