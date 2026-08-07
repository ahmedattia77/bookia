import 'package:bloc/bloc.dart';
import 'package:bookia/core/services/local_storage_service.dart';
import 'package:bookia/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeData themeData = LocalStorageService.getSavedTheme()
      ? AppTheme.darkMode
      : AppTheme.lightMode;

  ThemeCubit() : super(ThemeInitial());

  void changeMode() {
    if (themeData == AppTheme.darkMode) {
      themeData = AppTheme.lightMode;
      LocalStorageService.saveTheme(false);
    } else {
      themeData = AppTheme.darkMode;
      LocalStorageService.saveTheme(true);
    }

    emit(OnChangeState(themeData));
  }
}
