import 'package:flutter/material.dart';
import 'package:very_good_slide_puzzle/colors/colors.dart';
import 'package:very_good_slide_puzzle/dashatar/coidon.dart';
import 'package:very_good_slide_puzzle/l10n/l10n.dart';

/// {@template panda_theme}
/// The Red Panda theme.
/// {@endtemplate}
class PandaCoidonTheme extends CoidonTheme {
  /// {panda_theme}
  const PandaCoidonTheme() : super();

  @override
  String semanticsLabel(BuildContext context) =>
      context.l10n.coidonPandaLabelText;

  @override
  String get themeAsset => 'assets/images/coidon/gallery/panda.png';

  @override
  String get successThemeAsset => 'assets/images/coidon/success/panda.png';

  @override
  String get audioControlOffAsset =>
      'assets/images/audio_control/blue_dashatar_off.png';

  @override
  String get audioAsset => 'assets/audio/dumbbell.mp3';

  @override
  String get dashAssetsDirectory => 'assets/images/coidon/panda';

  @override
  String get name => 'Red Panda';

  @override
  String get status => 'EN';

  @override
  String get scientificName => 'Ailurus Fulgens';

  @override
  String get taxonomy => 'Class [Mammalia], Genus [Ailurus]';

  @override
  String get funFacts =>
      'Red pandas detect different scents with their tongues. The internet browser Firefox is named after Red pandas. Red pandas can eat as much as 200 000 bamboo leaves per day.';
}
