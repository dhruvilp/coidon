import 'package:flutter/material.dart';
import 'package:very_good_slide_puzzle/colors/colors.dart';
import 'package:very_good_slide_puzzle/dashatar/coidon.dart';
import 'package:very_good_slide_puzzle/l10n/l10n.dart';

/// {@template green_dashatar_theme}
/// The green dashatar puzzle theme.
/// {@endtemplate}
class TigerCoidonTheme extends CoidonTheme {
  /// {@macro green_dashatar_theme}
  const TigerCoidonTheme() : super();

  @override
  String semanticsLabel(BuildContext context) =>
      context.l10n.coidonTigerLabelText;

  @override
  Color get backgroundColor => PuzzleColors.white;

  @override
  Color get defaultColor => PuzzleColors.green90;

  @override
  Color get buttonColor => PuzzleColors.green50;

  @override
  Color get menuInactiveColor => PuzzleColors.green50;

  @override
  Color get countdownColor => PuzzleColors.green50;

  @override
  String get themeAsset => 'assets/images/coidon/gallery/tiger.png';

  @override
  String get successThemeAsset => 'assets/images/coidon/success/green.png';

  @override
  String get audioControlOffAsset =>
      'assets/images/audio_control/green_dashatar_off.png';

  @override
  String get audioAsset => 'assets/audio/skateboard.mp3';

  @override
  String get dashAssetsDirectory => 'assets/images/coidon/tiger';

  @override
  String get name => 'Tiger';

  @override
  String get status => 'EN';

  @override
  String get scientificName => 'Panthera tigris';
}
