// ignore_for_file: public_member_api_docs

part of 'dashatar_theme_bloc.dart';

abstract class CoidonThemeEvent extends Equatable {
  const CoidonThemeEvent();
}

class CoidonThemeChanged extends CoidonThemeEvent {
  const CoidonThemeChanged({required this.themeIndex});

  /// The index of the changed theme in [CoidonThemeState.themes].
  final int themeIndex;

  @override
  List<Object> get props => [themeIndex];
}
