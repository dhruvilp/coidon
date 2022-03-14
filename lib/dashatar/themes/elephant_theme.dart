import 'package:flutter/material.dart';
import 'package:very_good_slide_puzzle/colors/colors.dart';
import 'package:very_good_slide_puzzle/dashatar/coidon.dart';
import 'package:very_good_slide_puzzle/l10n/l10n.dart';

/// {@template elephant_theme}
/// The blue dashatar puzzle theme.
/// {@endtemplate}
class ElephantCoidonTheme extends CoidonTheme {
  /// {elephant_theme}
  const ElephantCoidonTheme() : super();

  @override
  String semanticsLabel(BuildContext context) =>
      context.l10n.coidonElephantLabelText;

  @override
  String get themeAsset => 'assets/images/coidon/gallery/elephant.png';

  @override
  String get successThemeAsset => 'assets/images/coidon/success/elephant.png';

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
