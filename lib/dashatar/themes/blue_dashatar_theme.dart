import 'package:flutter/material.dart';
import 'package:very_good_slide_puzzle/colors/colors.dart';
import 'package:very_good_slide_puzzle/dashatar/coidon.dart';
import 'package:very_good_slide_puzzle/l10n/l10n.dart';

/// {@template blue_dashatar_theme}
/// The blue dashatar puzzle theme.
/// {@endtemplate}
class ElephantCoidonTheme extends CoidonTheme {
  /// {@macro blue_dashatar_theme}
  const ElephantCoidonTheme() : super();

  @override
  String semanticsLabel(BuildContext context) =>
      context.l10n.coidonElephantLabelText;

  @override
  Color get backgroundColor => PuzzleColors.black;

  @override
  Color get defaultColor => PuzzleColors.blue90;

  @override
  Color get buttonColor => PuzzleColors.blue50;

  @override
  Color get menuInactiveColor => PuzzleColors.blue50;

  @override
  Color get countdownColor => PuzzleColors.blue50;

  @override
  String get themeAsset => 'assets/images/coidon/gallery/elephant.png';

  @override
  String get successThemeAsset => 'assets/images/coidon/success/blue.png';

  @override
  String get audioControlOffAsset =>
      'assets/images/audio_control/blue_dashatar_off.png';

  @override
  String get audioAsset => 'assets/audio/dumbbell.mp3';

  @override
  String get dashAssetsDirectory => 'assets/images/coidon/elephant';

  @override
  String get name => 'African Savanna Elephant';

  @override
  String get status => 'EN';

  @override
  String get scientificName => 'Loxodonta africana';
}
