import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:very_good_slide_puzzle/dashatar/coidon.dart';

part 'dashatar_theme_event.dart';
part 'dashatar_theme_state.dart';

/// {@template dashatar_theme_bloc}
/// Bloc responsible for the currently selected [CoidonTheme].
/// {@endtemplate}
class CoidonThemeBloc extends Bloc<CoidonThemeEvent, CoidonThemeState> {
  /// {@macro dashatar_theme_bloc}
  CoidonThemeBloc({required List<CoidonTheme> themes})
      : super(CoidonThemeState(themes: themes)) {
    on<CoidonThemeChanged>(_onCoidonThemeChanged);
  }

  void _onCoidonThemeChanged(
    CoidonThemeChanged event,
    Emitter<CoidonThemeState> emit,
  ) {
    emit(state.copyWith(theme: state.themes[event.themeIndex]));
  }
}
