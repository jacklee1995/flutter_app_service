import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'enums/language_enum.dart';
import 'enums/themes_enum.dart';
import 'utils/lang.dart';
import 'utils/theme.dart';

class AppService extends GetxController {
  /// SharedPreferences instance
  final SharedPreferences _prefs;

  /// All supported languages should be reflected here.
  final List<LanguageEnum> supportedLanguages;

  RxBool isDarkMode = false.obs;
  RxBool isSystemDarkMode = false.obs;
  RxBool followSystem = true.obs; // Dark mode following system
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

    // 监听系统深色模式的变化
    WidgetsBinding.instance.platformDispatcher.onPlatformBrightnessChanged =
        () {
      isSystemDarkMode.value =
          WidgetsBinding.instance.platformDispatcher.platformBrightness ==
              Brightness.dark;
      if (followSystem.value) {
        // 如果跟随系统，则根据系统深色模式更新暗黑模式
        isDarkMode.value = isSystemDarkMode.value;
        saveFollowSystem();
        saveDarkMode();
      }
      _updateTheme();
    };

    _updateTheme();
  }

  // Load status from SharedPreferences
  Future<void> _loadAppServiceSettings() async {
    // Load theme
    String? themeEnumString = _prefs.getString('themeEnum');

    // Load dark mode state
    bool? isDarkModeValue = _prefs.getBool('isDarkMode');

    // Load follow system state
    bool? followSystemValue = _prefs.getBool('followSystem');
    if (followSystemValue != null) {
      followSystem.value = followSystemValue;
    }

    if (themeEnumString != null) {
      ColorThemesEnum themeEnum = ColorThemesEnum.values
          .firstWhere((e) => e.toString() == themeEnumString);

      if (isDarkModeValue != null) {
        isDarkMode.value = isDarkModeValue;
      }

      // Update color theme
      setColorTheme(themeEnum);
    }
    // 检查系统深色模式状态
    isSystemDarkMode.value =
        WidgetsBinding.instance.platformDispatcher.platformBrightness ==
            Brightness.dark;
    // Loading language
    String? langEnumString = _prefs.getString('langEnum');

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
    _updateTheme();
    saveColorTheme();
  }

  void _updateTheme() {
    Get.changeTheme(getThemeDataByEnum(
        _themesEnum.value, isSystemDarkMode.value || isDarkMode.value));
    Get.forceAppUpdate();
  }

  void setDarkMode() {
    followSystem.value = false;
    isDarkMode.value = true;
    _updateTheme();
    saveFollowSystem();
    saveDarkMode();
  }

  void setLightMode() {
    followSystem.value = false;
    isDarkMode.value = false;
    _updateTheme();
    saveFollowSystem();
    saveDarkMode();
  }

  /// Toggle dark mode
  void toggleDarkMode() {
    followSystem.value = false;
    isDarkMode.value = !isDarkMode.value;
    // Update dark mode
    setColorTheme(_themesEnum.value);
    saveFollowSystem();
    saveDarkMode();
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

  /// Save follow system state
  Future<void> saveFollowSystem() async {
    _prefs.setBool('followSystem', followSystem.value);
  }

  /// save Preservation language state
  Future<void> saveLocale() async {
    _prefs.setString('langEnum', language.value.toString());
  }
}
