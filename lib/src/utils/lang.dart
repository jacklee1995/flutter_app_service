import '../../app_service.dart';
import '../maps/country_code_map.dart';
import '../maps/lang_enum_to_string_map.dart';
import '../maps/str_to_lang_enum_map.dart';

/// Language enum value to string
String? langEnumToStr(LanguageEnum lang) {
  return languageEnumToStringMap[lang];
}

/// Convert the language logo to the corresponding country logo
String getCountryCode(String item) {
  return countryCodeMap[item] ?? '';
}

/// Convert a language string to the corresponding language enum
LanguageEnum? strToLangEnum(String langStr) {
  return strToLangEnumMap[langStr];
}
