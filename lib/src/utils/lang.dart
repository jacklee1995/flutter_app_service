import '../../app_service.dart';
import '../maps/country_code_map.dart';
import '../maps/lang_enum_to_string_map.dart';
import '../maps/str_to_lang_enum_map.dart';

// 语言枚举值转字符串
String? langEnumToStr(LanguageEnum lang) {
  return languageEnumToStringMap[lang];
}

/// 将语言标识转换为相应的国家标识。
String getCountryCode(String item) {
  return countryCodeMap[item] ?? '';
}

/// 将语言字符串转换为相应的语言枚举
LanguageEnum? strToLangEnum(String langStr) {
  return strToLangEnumMap[langStr];
}
