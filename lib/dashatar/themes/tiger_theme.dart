import 'package:flutter/material.dart';
import 'package:very_good_slide_puzzle/colors/colors.dart';
import 'package:very_good_slide_puzzle/dashatar/coidon.dart';
import 'package:very_good_slide_puzzle/l10n/l10n.dart';

/// {@template tiger_theme}
/// The green dashatar puzzle theme.
/// {@endtemplate}
class TigerCoidonTheme extends CoidonTheme {
  /// {tiger_theme}
  const TigerCoidonTheme() : super();

  @override
  String semanticsLabel(BuildContext context) =>
      context.l10n.coidonTigerLabelText;

  @override
  String get themeAsset => 'assets/images/coidon/gallery/tiger.png';

  @override
  String get successThemeAsset => 'assets/images/coidon/success/tiger.png';

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

  @override
  String get taxonomy => 'Class [Mammalia], Genus [Panthera]';

  @override
  String get funFacts =>
      "The tiger is the national animal of India, Bangladesh, Malaysia, and South Korea. Tigers can cross rivers up to 7 km (4.3 mi) wide and can swim up to 29 km (18 mi) in a day. Did you know that a tiger's coat pattern is still visible when it is shaved.";
}
