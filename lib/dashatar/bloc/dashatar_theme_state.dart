// ignore_for_file: public_member_api_docs

part of 'dashatar_theme_bloc.dart';

class CoidonThemeState extends Equatable {
  const CoidonThemeState({
    required this.themes,
    this.theme = const ElephantCoidonTheme(),
  });

  /// The list of all available [CoidonTheme]s.
  final List<CoidonTheme> themes;

  /// Currently selected [CoidonTheme].
  final CoidonTheme theme;

  @override
  List<Object> get props => [themes, theme];

  CoidonThemeState copyWith({
    List<CoidonTheme>? themes,
    CoidonTheme? theme,
  }) {
    return CoidonThemeState(
      themes: themes ?? this.themes,
      theme: theme ?? this.theme,
    );
  }
}
