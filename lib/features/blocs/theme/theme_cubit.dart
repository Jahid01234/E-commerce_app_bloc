import 'package:bloc_ecommerce_app/core/services/shared_preferences/local_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.light);

  static const String _key = "isDarkTheme";

  void loadTheme() {
    final isDark = LocalPreferences.getBool(_key, defaultValue: false);
    emit(isDark ? ThemeMode.dark : ThemeMode.light);
  }

  void toggleTheme(bool isDark) {
    LocalPreferences.setBool(_key, isDark);
    emit(isDark ? ThemeMode.dark : ThemeMode.light);
  }

  bool get isDark => state == ThemeMode.dark;
}