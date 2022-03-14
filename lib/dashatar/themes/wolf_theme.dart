import 'package:flutter/material.dart';
import 'package:very_good_slide_puzzle/colors/colors.dart';
import 'package:very_good_slide_puzzle/dashatar/coidon.dart';
import 'package:very_good_slide_puzzle/l10n/l10n.dart';

/// {@template wolf_theme}
/// The yellow dashatar puzzle theme.
/// {@endtemplate}
class RedWolfCoidonTheme extends CoidonTheme {
  /// {wolf_theme}
  const RedWolfCoidonTheme() : super();

  @override
  String semanticsLabel(BuildContext context) =>
      context.l10n.coidonWolfLabelText;

  @override
  String get themeAsset => 'assets/images/coidon/gallery/wolf.png';

  @override
  String get successThemeAsset => 'assets/images/coidon/success/wolf.png';

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

  @override
  String get taxonomy => 'Class [Mammalia], Genus [Canis]';

  @override
  String get funFacts =>
      'The species was declared extinct in the wild in 1980. They were reintroduced into eastern North Carolina in 1987. The red wolf is one of the rarest animal species in the world.';
}
