import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:very_good_slide_puzzle/audio_control/audio_control.dart';
import 'package:very_good_slide_puzzle/colors/colors.dart';
import 'package:very_good_slide_puzzle/dashatar/coidon.dart';
import 'package:very_good_slide_puzzle/helpers/helpers.dart';
import 'package:very_good_slide_puzzle/layout/layout.dart';
import 'package:very_good_slide_puzzle/typography/text_styles.dart';

import '../../theme/theme.dart';

/// {@template dashatar_theme_picker}
/// Displays the Dashatar theme picker to choose between
/// [CoidonThemeState.themes].
///
/// By default allows to choose between [ElephantCoidonTheme],
/// [TigerCoidonTheme] or [RedWolfCoidonTheme].
/// {@endtemplate}
class CoidonThemePicker extends StatefulWidget {
  /// {@macro dashatar_theme_picker}
  const CoidonThemePicker({
    Key? key,
    AudioPlayerFactory? audioPlayer,
  })  : _audioPlayerFactory = audioPlayer ?? getAudioPlayer,
        super(key: key);

  // static const _activeThemeNormalSize = 120.0;
  // static const _activeThemeSmallSize = 65.0;
  // static const _inactiveThemeNormalSize = 96.0;
  // static const _inactiveThemeSmallSize = 50.0;
  static const _activeThemeNormalSize = 60.0;
  static const _activeThemeSmallSize = 32.0;
  static const _inactiveThemeNormalSize = 48.0;
  static const _inactiveThemeSmallSize = 25.0;

  final AudioPlayerFactory _audioPlayerFactory;

  @override
  State<CoidonThemePicker> createState() => _CoidonThemePickerState();
}

class _CoidonThemePickerState extends State<CoidonThemePicker> {
  late final AudioPlayer _audioPlayer;

  @override
  void initState() {
    super.initState();
    _audioPlayer = widget._audioPlayerFactory();
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeState = context.watch<CoidonThemeBloc>().state;
    final activeTheme = themeState.theme;

    return AudioControlListener(
      audioPlayer: _audioPlayer,
      child: ResponsiveLayoutBuilder(
        small: (_, child) => child!,
        medium: (_, child) => child!,
        large: (_, child) => child!,
        child: (currentSize) {
          final isSmallSize = currentSize == ResponsiveLayoutSize.small;
          final activeSize = isSmallSize
              ? CoidonThemePicker._activeThemeSmallSize
              : CoidonThemePicker._activeThemeNormalSize;
          final inactiveSize = isSmallSize
              ? CoidonThemePicker._inactiveThemeSmallSize
              : CoidonThemePicker._inactiveThemeNormalSize;
          final creditSourceTxtAlign = currentSize == ResponsiveLayoutSize.large
              ? CrossAxisAlignment.end
              : CrossAxisAlignment.center;
          final taxonomyHeaderTxtStyle = PuzzleTextStyle.headline5.copyWith(
            color: PuzzleColors.white5,
            fontSize: 14,
            letterSpacing: 1,
            fontWeight: FontWeight.w400,
          );
          final taxonomyTxtStyle = PuzzleTextStyle.headline5.copyWith(
            color: Colors.green[300],
            fontSize: 20,
            letterSpacing: 1,
            fontWeight: FontWeight.w200,
          );
          final factsTxtStyle = PuzzleTextStyle.headline5.copyWith(
            color: Colors.green[300],
            fontSize: 16,
            letterSpacing: 1,
            fontWeight: FontWeight.w200,
          );
          final taxonomyTxtAlign = currentSize == ResponsiveLayoutSize.small
              ? TextAlign.center
              : TextAlign.right;
          final factsTxtAlign = currentSize == ResponsiveLayoutSize.small
              ? TextAlign.center
              : TextAlign.right;

          return SizedBox(
            key: const Key('dashatar_theme_picker'),
            height: activeSize + 480,
            child: Column(
              crossAxisAlignment: creditSourceTxtAlign,
              children: [
                Text(
                  'Taxonomy',
                  style: taxonomyHeaderTxtStyle,
                ),
                AnimatedDefaultTextStyle(
                  style: taxonomyTxtStyle,
                  duration: PuzzleThemeAnimationDuration.textStyle,
                  child: Text(
                    themeState.theme.taxonomy,
                    textAlign: taxonomyTxtAlign,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Text(
                  'Fun Facts',
                  style: taxonomyHeaderTxtStyle,
                ),
                AnimatedDefaultTextStyle(
                  style: factsTxtStyle,
                  duration: PuzzleThemeAnimationDuration.textStyle,
                  child: SizedBox(
                    width: 300,
                    child: Text(
                      themeState.theme.funFacts,
                      textAlign: factsTxtAlign,
                      softWrap: true,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                PuzzleButton(
                  textColor: Colors.black,
                  backgroundColor: Colors.green[200],
                  onPressed: () {
                    Navigator.of(context)
                        .restorablePush(_takeActionDialogBuilder);
                  },
                  child: Text(
                    'TAKE ACTION',
                    style: PuzzleTextStyle.headline5.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 1.2,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    themeState.themes.length,
                    (index) {
                      final theme = themeState.themes[index];
                      final isActiveTheme = theme == activeTheme;
                      final padding =
                          index > 0 ? (isSmallSize ? 4.0 : 8.0) : 0.0;
                      final size = isActiveTheme ? activeSize : inactiveSize;

                      return Padding(
                        padding: EdgeInsets.only(left: padding),
                        child: MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            key: Key('dashatar_theme_picker_$index'),
                            onTap: () async {
                              if (isActiveTheme) {
                                return;
                              }

                              // Update the current Dashatar theme.
                              context
                                  .read<CoidonThemeBloc>()
                                  .add(CoidonThemeChanged(themeIndex: index));

                              // Play the audio of the current Dashatar theme.
                              await _audioPlayer.setAsset(theme.audioAsset);
                              unawaited(_audioPlayer.play());
                            },
                            child: AnimatedContainer(
                              width: size,
                              height: size,
                              curve: Curves.easeInOut,
                              duration: const Duration(milliseconds: 350),
                              child: Image.asset(
                                theme.themeAsset,
                                fit: BoxFit.fill,
                                semanticLabel: theme.semanticsLabel(context),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).restorablePush(_dialogBuilder);
                  },
                  child: Text(
                    'Credit Source',
                    style: PuzzleTextStyle.label.copyWith(
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  static Route<Object?> _dialogBuilder(
      BuildContext context, Object? arguments) {
    const sourceHeaderTextStyle =
        TextStyle(fontSize: 16, fontWeight: FontWeight.bold);
    const sourceTextStyle = TextStyle(fontSize: 14);

    return DialogRoute<void>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Page Credit Sources'),
        content: SingleChildScrollView(
          child: ListBody(
            children: const <Widget>[
              Text(
                'Species Data',
                style: sourceHeaderTextStyle,
              ),
              ListTile(
                leading: Text('1'),
                dense: true,
                title: Text(
                  'African Savanna Elephant (https://www.iucnredlist.org/species/181008073/204401095)',
                  style: sourceTextStyle,
                ),
                subtitle: Text(
                  'image source: (https://unsplash.com/photos/Bj0XFTabquo)',
                  style: sourceTextStyle,
                ),
              ),
              ListTile(
                leading: Text('2'),
                dense: true,
                title: Text(
                  'Tiger (https://www.iucnredlist.org/species/15955/50659951)',
                  style: sourceTextStyle,
                ),
                subtitle: Text(
                  'image source: (https://unsplash.com/photos/-iZV3CqT7LM)',
                  style: sourceTextStyle,
                ),
              ),
              ListTile(
                leading: Text('3'),
                dense: true,
                title: Text(
                  'Red Wolf (https://www.iucnredlist.org/species/3747/163509841)',
                  style: sourceTextStyle,
                ),
                subtitle: Text(
                  'image source: (https://pixabay.com/photos/red-wolf-rocks-nature-predator-3411072/)',
                  style: sourceTextStyle,
                ),
              ),
              ListTile(
                leading: Text('4'),
                dense: true,
                title: Text(
                  'Red Panda (https://www.iucnredlist.org/species/714/110023718)',
                  style: sourceTextStyle,
                ),
                subtitle: Text(
                  'image source: (https://pixabay.com/photos/red-panda-leaves-branch-outdoors-1852789/)',
                  style: sourceTextStyle,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Additional Data',
                style: sourceHeaderTextStyle,
              ),
              ListTile(
                leading: Text('1'),
                dense: true,
                title: Text(
                  'African Savanna Elephant (https://animalia.bio/african-bush-elephant)',
                  style: sourceTextStyle,
                ),
                subtitle: Text(
                  'wikipedia: (https://en.wikipedia.org/wiki/African_elephant)',
                  style: sourceTextStyle,
                ),
              ),
              ListTile(
                leading: Text('2'),
                dense: true,
                title: Text(
                  'Tiger (https://animalia.bio/tiger)',
                  style: sourceTextStyle,
                ),
                subtitle: Text(
                  'wikipedia: (https://en.wikipedia.org/wiki/Tiger)',
                  style: sourceTextStyle,
                ),
              ),
              ListTile(
                leading: Text('3'),
                dense: true,
                title: Text(
                  'Red Wolf (https://animalia.bio/red-wolf)',
                  style: sourceTextStyle,
                ),
                subtitle: Text(
                  'wikipedia: (https://en.wikipedia.org/wiki/Red_wolf)',
                  style: sourceTextStyle,
                ),
              ),
              ListTile(
                leading: Text('4'),
                dense: true,
                title: Text(
                  'Red Panda (https://animalia.bio/red-panda)',
                  style: sourceTextStyle,
                ),
                subtitle: Text(
                  'wikipedia: (https://en.wikipedia.org/wiki/Red_panda)',
                  style: sourceTextStyle,
                ),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

  static Route<Object?> _takeActionDialogBuilder(
      BuildContext context, Object? arguments) {
    const sourceHeaderTextStyle =
        TextStyle(fontSize: 16, fontWeight: FontWeight.bold);
    const sourceTextStyle = TextStyle(fontSize: 14);

    return DialogRoute<void>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Take Action'),
        content: SingleChildScrollView(
          child: ListBody(
            children: const <Widget>[
              Text(
                'Species',
                style: sourceHeaderTextStyle,
              ),
              ListTile(
                leading: Text('1'),
                dense: true,
                title: Text(
                  'African Savanna Elephant',
                  style: sourceTextStyle,
                ),
                subtitle: Text(
                  'Save species project: https://www.savetheelephants.org/',
                  style: sourceTextStyle,
                ),
              ),
              ListTile(
                leading: Text('2'),
                dense: true,
                title: Text(
                  'Tiger',
                  style: sourceTextStyle,
                ),
                subtitle: Text(
                  'Save species project: https://www.savetigersnow.org/',
                  style: sourceTextStyle,
                ),
              ),
              ListTile(
                leading: Text('3'),
                dense: true,
                title: Text(
                  'Red Wolf',
                  style: sourceTextStyle,
                ),
                subtitle: Text(
                  'Save species project: https://www.redwolfproject.com/',
                  style: sourceTextStyle,
                ),
              ),
              ListTile(
                leading: Text('4'),
                dense: true,
                title: Text(
                  'Red Panda',
                  style: sourceTextStyle,
                ),
                subtitle: Text(
                  'Save species project: https://redpandanetwork.org/',
                  style: sourceTextStyle,
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
