import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'enums/language_enum.dart';
import 'enums/themes_enum.dart';
import 'utils/lang.dart';
import 'utils/theme.dart';

class AppService extends GetxService {
  /// All supported languages should be reflected here.
  final List<LanguageEnum> supportedLanguages;

  RxBool isDarkMode = false.obs;
  final Rx<ColorThemesEnum> _themesEnum =
      ColorThemesEnum.blueDelight.obs; // Initialize to blueDelight theme
  final Rx<LanguageEnum> language = LanguageEnum.enUS.obs;

  AppService({
    this.supportedLanguages = const [
      LanguageEnum.zh,
      LanguageEnum.en,
    ],
    defaultLang = LanguageEnum.en,
  }) {
    language.value = defaultLang;
  }

  /// Get the current theme data,
  /// which is generally used for application
  /// initialization.
  ThemeData get currentTheme {
    return getThemeDataByEnum(_themesEnum.value, isDarkMode.value);
  }

  /// Gets the current language enumeration value.
  LanguageEnum get currentLang {
    return language.value;
  }

  /// Gets the current language name string
  String get currentLangStr {
    String? lang = langEnumToStr(language.value);

    if (lang == null) {
      return langEnumToStr(LanguageEnum.enUS)!;
    }
    return lang;
  }

  /// Set a new color theme
  /// - themeEnum: Enumeration value representing language theme.
  void setColorTheme(ColorThemesEnum themeEnum) {
    _themesEnum.value = themeEnum;
    Get.changeTheme(getThemeDataByEnum(_themesEnum.value, isDarkMode.value));

    saveState();
  }

  /// Switch to dark mode
  void setDarkMode() {
    isDarkMode.value = true;
    setColorTheme(_themesEnum.value);
    saveState();
  }

  /// Switch to white light mode
  void setLightMode() {
    isDarkMode.value = false;
    setColorTheme(_themesEnum.value);
    saveState();
  }

  /// Toggle dark mode
  void toggleDarkMode() {
    isDarkMode.value = !isDarkMode.value;
    // Update dark mode
    setColorTheme(_themesEnum.value);
    saveState();
  }

  /// Set an internationalized language as
  /// the current language.
  void updateLocale(LanguageEnum newLanguage) {
    language.value = newLanguage;
    String? langStr = langEnumToStr(language.value);

    if (langStr != null) {
      if (langStr == 'en') {
        Get.updateLocale(const Locale('en', 'US'));
      }
      Get.updateLocale(Locale(langStr));
    }

    saveState();
  }

  // Load status from SharedPreferences
  Future<void> init() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Load theme
    String? themeEnumString = prefs.getString('themeEnum');
    if (themeEnumString != null) {
      ColorThemesEnum themeEnum = ColorThemesEnum.values
          .firstWhere((e) => e.toString() == themeEnumString);
      // Update color theme
      setColorTheme(themeEnum);
    }

    // Load dark mode state
    bool? isDarkModeValue = prefs.getBool('isDarkMode');
    if (isDarkModeValue != null) {
      isDarkMode.value = isDarkModeValue;
      // Update color theme
      setColorTheme(_themesEnum.value);
    }

    // Loading language
    String? langEnumString = prefs.getString('langEnum');
    if (langEnumString != null) {
      LanguageEnum langEnum =
          LanguageEnum.values.firstWhere((e) => e.toString() == langEnumString);
      // Update language
      updateLocale(langEnum);
    }
  }

  // Save state to SharedPreferences.
  Future<void> saveState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Save theme
    prefs.setString('themeEnum', _themesEnum.value.toString());

    // Save dark mode state
    prefs.setBool('isDarkMode', isDarkMode.value);

    // Preservation language
    prefs.setString('langEnum', language.value.toString());
  }
}
