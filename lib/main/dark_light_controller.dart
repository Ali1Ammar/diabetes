import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final darkModeProvider = StateNotifierProvider<DarkModeController, ThemeMode>(
    (_) => DarkModeController(_.read)..init());

class DarkModeController extends StateNotifier<ThemeMode> {
  final Reader read;
  DarkModeController(
    this.read,
  ) : super(ThemeMode.system);

  // bool get isDarkEnable => state == ThemeMode.dark;

  Future<void> init() async {
    final inst = await SharedPreferences.getInstance();
    final intMode = inst.getInt("thememode");
    if (intMode == null) {
    } else {
      final mode = ThemeMode.values[intMode];
      state = mode;
    }
  }

  void _setTo(ThemeMode mode) async {
    state = mode;

    final inst = await SharedPreferences.getInstance();
    inst.setInt("thememode", mode.index);
  }

  void setTo(bool toDark) {
    final newState = toDark ? ThemeMode.dark : ThemeMode.light;
    if (newState != state) _setTo(newState);
  }

  /// this make a probleam if used with DayNightSwitcher onStateChanged directly
  Future<void> toggle() async {
    final newState = _toggle(state);
    _setTo(newState);
  }

  ThemeMode _toggle(ThemeMode i) =>
      i == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
}

extension ThemeModeEx on ThemeMode {
  bool get isDark => this == ThemeMode.dark;
}
