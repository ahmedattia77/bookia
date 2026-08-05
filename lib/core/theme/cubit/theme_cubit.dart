import 'package:bloc/bloc.dart';
import 'package:bookia/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitial());
  ThemeData theme = AppTheme.lightMode;
  void changeMode() {
    if (theme == AppTheme.darkMode) {
      theme = AppTheme.lightMode;
    } else {
      theme = AppTheme.darkMode;
    }
    // emit(OnChangeState(theme));
    emit(OnChangeState(AppTheme.darkMode));
  }
}
