import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'enums/language_enum.dart';
import 'enums/themes_enum.dart';
import 'utils/lang.dart';
import 'utils/theme.dart';

void pinkPrint(e) {
  String pinkColor = '\x1B[38;5;206m'; // 粉红色
  String resetColor = '\x1B[0m'; // 恢复默认颜色

  // 打印粉红色文本
  debugPrint('${pinkColor}$e${resetColor}');
}

class AppService extends GetxController {
  /// SharedPreferences instance
  final SharedPreferences _prefs;

  /// All supported languages should be reflected here.
  final List<LanguageEnum> supportedLanguages;

  RxBool isDarkMode = false.obs;
  final Rx<ColorThemesEnum> _themesEnum =
      ColorThemesEnum.blueDelight.obs; // Initialize to blueDelight theme
  final Rx<LanguageEnum> language = LanguageEnum.enUS.obs;
  AppService(
    this._prefs, {
    this.supportedLanguages = const [
      LanguageEnum.zh,
      LanguageEnum.en,
    ],
  });

  @override
  void onInit() {
    super.onInit();
    _loadAppServiceSettings();
  }

  // Load status from SharedPreferences
  Future<void> _loadAppServiceSettings() async {
    // Load theme
    String? themeEnumString = _prefs.getString('themeEnum');

    // Load dark mode state
    bool? isDarkModeValue = _prefs.getBool('isDarkMode');

    if (themeEnumString != null) {
      ColorThemesEnum themeEnum = ColorThemesEnum.values
          .firstWhere((e) => e.toString() == themeEnumString);

      if (isDarkModeValue != null) {
        isDarkMode.value = isDarkModeValue;
      }

      // Update color theme
      setColorTheme(themeEnum);
    }

    // Loading language
    String? langEnumString = _prefs.getString('langEnum');
    pinkPrint('Load LangEnumString = $langEnumString');

    if (langEnumString != null) {
      LanguageEnum langEnum =
          LanguageEnum.values.firstWhere((e) => e.toString() == langEnumString);
      // Update language
      updateLocale(langEnum);
    } else {
      updateLocale(supportedLanguages[0]);
    }
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

    saveColorTheme();
  }

  /// Switch to dark mode
  void setDarkMode() {
    isDarkMode.value = true;
    setColorTheme(_themesEnum.value);
    saveDarkMode();
  }

  /// Switch to white light mode
  void setLightMode() {
    isDarkMode.value = false;
    setColorTheme(_themesEnum.value);
    saveDarkMode();
  }

  /// Toggle dark mode
  void toggleDarkMode() {
    isDarkMode.value = !isDarkMode.value;
    // Update dark mode
    setColorTheme(_themesEnum.value);
    saveDarkMode();
  }

  /// Set an internationalized language as
  /// the current language.
  void updateLocale(LanguageEnum newLanguage) {
    pinkPrint(
        '---------------------------------------------------------------');
    pinkPrint('updateLocale to $newLanguage');
    language.value = newLanguage;
    String? langStr = langEnumToStr(language.value);

    if (langStr != null) {
      if (langStr == 'en') {
        Get.updateLocale(const Locale('en', 'US'));
      }
      pinkPrint('Get.updateLocale $langStr');
      Get.updateLocale(Locale(langStr));
    }
    saveLocale();
  }

  /// Save color theme state
  Future<void> saveColorTheme() async {
    _prefs.setString('themeEnum', _themesEnum.value.toString());
  }

  /// Save dark mode state
  Future<void> saveDarkMode() async {
    _prefs.setBool('isDarkMode', isDarkMode.value);
  }

  /// save Preservation language state
  Future<void> saveLocale() async {
    _prefs.setString('langEnum', language.value.toString());
  }
}
