import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'enums/language_enum.dart';
import 'enums/themes_enum.dart';
import 'utils/lang.dart';
import 'utils/theme.dart';

class AppService extends GetxService {
  /// 所有支持的语言都应该在这里体现
  final List<LanguageEnum> supportedLanguages;

  RxBool isDarkMode = false.obs;
  final Rx<ColorThemesEnum> _themesEnum =
      ColorThemesEnum.blueDelight.obs; // 初始化为 blueDelight 主题
  final Rx<LanguageEnum> language = LanguageEnum.enUs.obs;

  AppService({
    this.supportedLanguages = const [
      LanguageEnum.zh,
      LanguageEnum.en,
    ],
    defaultLang = LanguageEnum.en,
  }) {
    language.value = defaultLang;
  }

  /// 获取当前的主题数据，一般用于应用初始化
  ThemeData get currentTheme {
    return getThemeDataByEnum(_themesEnum.value, isDarkMode.value);
  }

  /// 获取当前的语言枚举值
  LanguageEnum get currentLang {
    return language.value;
  }

  /// 获取当前的语言字符串
  String get currentLangStr {
    String? lang = langEnumToStr(language.value);

    if (lang == null) {
      return langEnumToStr(LanguageEnum.enUs)!;
    }
    return lang;
  }

  /// 设置新的颜色主题
  /// - themeEnum 表示语言主题的枚举值
  void setColorTheme(ColorThemesEnum themeEnum) {
    _themesEnum.value = themeEnum;
    Get.changeTheme(getThemeDataByEnum(_themesEnum.value, isDarkMode.value));

    saveState();
  }

  /// 切换到暗黑模式
  void setDarkMode() {
    isDarkMode.value = true;
    setColorTheme(_themesEnum.value);
    saveState();
  }

  /// 切换到白亮模式
  void setLightMode() {
    isDarkMode.value = false;
    setColorTheme(_themesEnum.value);
    saveState();
  }

  /// 切换暗黑模式
  void toggleDarkMode() {
    isDarkMode.value = !isDarkMode.value;
    // 切换暗黑模式
    setColorTheme(_themesEnum.value);
    saveState();
  }

  /// 设置一种实现了国际化的语言作为当前语言
  void updateLocale(LanguageEnum newLanguage) {
    language.value = newLanguage;
    String? langStr = langEnumToStr(language.value);

    // 切换语言的逻辑，如加载对应的语言包等
    if (langStr == 'CN') {
      Get.updateLocale(const Locale('zh', 'CN'));
    } else if (langStr == 'zh') {
      Get.updateLocale(const Locale('zh', 'CN'));
    } else if (langStr == 'zh_TW') {
      Get.updateLocale(const Locale('zh', 'TW'));
    } else if (langStr == 'zh_HK') {
      Get.updateLocale(const Locale('zh', 'HK'));
    } else if (langStr == 'zh_Hans') {
      Get.updateLocale(const Locale('zh', 'Hans'));
    } else if (langStr == 'zh_Hant') {
      Get.updateLocale(const Locale('zh', 'Hant'));
    } else if (langStr == 'en') {
      Get.updateLocale(const Locale('en', 'UK'));
    } else if (langStr == 'UK') {
      Get.updateLocale(const Locale('en', 'UK'));
    } else if (langStr == 'US') {
      Get.updateLocale(const Locale('en', 'US'));
    } else if (langStr == null) {
      throw Exception('AppServiceError-setLanguage: langStr is null');
    } else {
      Get.updateLocale(Locale(langStr));
    }

    saveState();
  }

  // 从SharedPreferences加载状态
  Future<void> init() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // 加载主题
    String? themeEnumString = prefs.getString('themeEnum');
    if (themeEnumString != null) {
      ColorThemesEnum themeEnum = ColorThemesEnum.values
          .firstWhere((e) => e.toString() == themeEnumString);
      // 更新颜色主题
      setColorTheme(themeEnum);
    }

    // 加载暗黑模式状态
    bool? isDarkModeValue = prefs.getBool('isDarkMode');
    if (isDarkModeValue != null) {
      isDarkMode.value = isDarkModeValue;
      // 更新颜色主题
      setColorTheme(_themesEnum.value);
    }

    // 加载语言
    String? langEnumString = prefs.getString('langEnum');
    if (langEnumString != null) {
      LanguageEnum langEnum =
          LanguageEnum.values.firstWhere((e) => e.toString() == langEnumString);
      // 更新语言
      updateLocale(langEnum);
    }
  }

  // 将状态保存到SharedPreferences
  Future<void> saveState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // 保存主题
    prefs.setString('themeEnum', _themesEnum.value.toString());

    // 保存暗黑模式状态
    prefs.setBool('isDarkMode', isDarkMode.value);

    // 保存语言
    prefs.setString('langEnum', language.value.toString());
  }
}
