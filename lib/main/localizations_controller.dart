import 'package:flutter/widgets.dart';
import 'package:riverpod/riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final localizationsProvider =
    StateNotifierProvider<LocalizationsController, String?>(
        (_) => LocalizationsController(_.read)..init());

class LocalizationsController extends StateNotifier<String?> {
  final Reader read;
  LocalizationsController(
    this.read,
  ) : super(null);

  // bool get isDarkEnable => state == ThemeMode.dark;

  Future<void> init() async {
    final inst = await SharedPreferences.getInstance();
    final localization = inst.getString("Localizations");
    if (localization == null) {
    } else {
      state = localization;
    }
  }

  void setTo(String localization) async {
    state = localization;
    final inst = await SharedPreferences.getInstance();
    inst.setString("Localizations", localization);
  }

  static const supported = [
    Locale('ar', ''),
    Locale('en', ''),
  ];
}
