import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:very_good_slide_puzzle/colors/colors.dart';
import 'package:very_good_slide_puzzle/layout/layout.dart';
import 'package:very_good_slide_puzzle/theme/theme.dart';
import 'package:very_good_slide_puzzle/typography/typography.dart';

/// {@template puzzle_population_trend}
/// Displays the subtitle of the puzzle in the given color.
/// {@endtemplate}
class PuzzlePopulationTrend extends StatelessWidget {
  /// {puzzle_population_trend}
  const PuzzlePopulationTrend({
    Key? key,
    required this.title,
    this.color,
  }) : super(key: key);

  /// The title to be displayed.
  final String title;

  /// The color of [title], defaults to [PuzzleTheme.titleColor].
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final theme = context.select((ThemeBloc bloc) => bloc.state.theme);
    final titleColor = color ?? theme.titleColor;

    return ResponsiveLayoutBuilder(
      small: (context, child) => Center(
        child: SizedBox(
          width: 300,
          child: Center(
            child: child,
          ),
        ),
      ),
      medium: (context, child) => Center(
        child: child,
      ),
      large: (context, child) => SizedBox(
        width: 300,
        child: child,
      ),
      child: (currentSize) {
        final textStyle = PuzzleTextStyle.headline5.copyWith(
          color: PuzzleColors.white5,
          fontSize: 12,
          fontWeight: FontWeight.w400,
          letterSpacing: 1.2,
        );

        final textAlign = currentSize == ResponsiveLayoutSize.large
            ? TextAlign.left
            : TextAlign.center;

        final itemAlign = currentSize == ResponsiveLayoutSize.large
            ? MainAxisAlignment.start
            : MainAxisAlignment.center;

        return Padding(
          padding: const EdgeInsets.only(top: 20),
          child: AnimatedDefaultTextStyle(
            style: textStyle,
            duration: PuzzleThemeAnimationDuration.textStyle,
            child: Row(
              mainAxisAlignment: itemAlign,
              children: [
                Text(
                  title,
                  textAlign: textAlign,
                ),
                const Icon(
                  Icons.arrow_drop_down_circle_rounded,
                  color: Colors.red,
                  size: 20,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
