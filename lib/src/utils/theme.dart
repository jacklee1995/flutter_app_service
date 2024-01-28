import 'package:flutter/material.dart';

import '../enums/themes_enum.dart';

import '../maps/theme_map.dart';
import '../maps/theme_name_map.dart';
import '../themes/blue_delight.dart';

/// 将颜色主题和暗黑模式组合，返回对应的主题数据对象（ThemeData）
/// - themeName 主题名
/// - 是否使用暗黑模式
ThemeData getThemeDataByName(String themeName, bool isDarkMode) {
  if (isDarkMode) {
    return themesMap['${themeName}Dark'] ?? blueDelightDarkTheme;
  } else {
    return themesMap['${themeName}Light'] ?? blueDelightLightTheme;
  }
}

/// Dart函数 themeEnumToStr
String? themeEnumToStr(ColorThemesEnum theme) {
  // 如果枚举值存在于映射中，则返回相应的文本，否则返回null
  return themeNameMap[theme];
}

/// 通过枚举获取主题数据（ThemeData）
ThemeData getThemeDataByEnum(ColorThemesEnum themeEnum, bool isDarkMode) {
  switch (themeEnum) {
    case ColorThemesEnum.amberBlue:
      return getThemeDataByName('amberBlue', isDarkMode);
    case ColorThemesEnum.aquaBlue:
      return getThemeDataByName('aquaBlue', isDarkMode);
    case ColorThemesEnum.bahamaTrinidad:
      return getThemeDataByName('bahamaTrinidad', isDarkMode);
    case ColorThemesEnum.barossa:
      return getThemeDataByName('barossa', isDarkMode);
    case ColorThemesEnum.bigStoneTulip:
      return getThemeDataByName('bigStoneTulip', isDarkMode);
    case ColorThemesEnum.blueDelight:
      return getThemeDataByName('blueDelight', isDarkMode);
    case ColorThemesEnum.blueStoneTeal:
      return getThemeDataByName('blueStoneTeal', isDarkMode);
    case ColorThemesEnum.blueWhale:
      return getThemeDataByName('blueWhale', isDarkMode);
    case ColorThemesEnum.blumine:
      return getThemeDataByName('blumine', isDarkMode);
    case ColorThemesEnum.brandBlue:
      return getThemeDataByName('brandBlue', isDarkMode);
    case ColorThemesEnum.brownOrange:
      return getThemeDataByName('brownOrange', isDarkMode);
    case ColorThemesEnum.camaroneGreen:
      return getThemeDataByName('camaroneGreen', isDarkMode);
    case ColorThemesEnum.damaskLunar:
      return getThemeDataByName('damaskLunar', isDarkMode);
    case ColorThemesEnum.deepBlueSea:
      return getThemeDataByName('deepBlueSea', isDarkMode);
    case ColorThemesEnum.deepPurple:
      return getThemeDataByName('deepPurple', isDarkMode);
    case ColorThemesEnum.dellGenoaGreen:
      return getThemeDataByName('dellGenoaGreen', isDarkMode);
    case ColorThemesEnum.ebonyClay:
      return getThemeDataByName('ebonyClay', isDarkMode);
    case ColorThemesEnum.eggplantPurple:
      return getThemeDataByName('eggplantPurple', isDarkMode);
    case ColorThemesEnum.endeavourBlue:
      return getThemeDataByName('endeavourBlue', isDarkMode);
    case ColorThemesEnum.espressoCrema:
      return getThemeDataByName('espressoCrema', isDarkMode);
    case ColorThemesEnum.flutterDash:
      return getThemeDataByName('flutterDash', isDarkMode);
    case ColorThemesEnum.goldSunset:
      return getThemeDataByName('goldSunset', isDarkMode);
    case ColorThemesEnum.greens:
      return getThemeDataByName('greens', isDarkMode);
    case ColorThemesEnum.greenForest:
      return getThemeDataByName('greenForest', isDarkMode);
    case ColorThemesEnum.greenJungle:
      return getThemeDataByName('greenJungle', isDarkMode);
    case ColorThemesEnum.greenMoney:
      return getThemeDataByName('greenMoney', isDarkMode);
    case ColorThemesEnum.greyLaw:
      return getThemeDataByName('greyLaw', isDarkMode);
    case ColorThemesEnum.hippieBlue:
      return getThemeDataByName('hippieBlue', isDarkMode);
    case ColorThemesEnum.indigoNight:
      return getThemeDataByName('indigoNight', isDarkMode);
    case ColorThemesEnum.indigoSanMarino:
      return getThemeDataByName('indigoSanMarino', isDarkMode);
    case ColorThemesEnum.lipstickPink:
      return getThemeDataByName('lipstickPink', isDarkMode);
    case ColorThemesEnum.mallardValencia:
      return getThemeDataByName('mallardValencia', isDarkMode);
    case ColorThemesEnum.mangoMojito:
      return getThemeDataByName('mangoMojito', isDarkMode);
    case ColorThemesEnum.material3:
      return getThemeDataByName('material3', isDarkMode);
    case ColorThemesEnum.material3HighContrast:
      return getThemeDataByName('material3HighContrast', isDarkMode);
    case ColorThemesEnum.material3Purple:
      return getThemeDataByName('material3Purple', isDarkMode);
    case ColorThemesEnum.midnight:
      return getThemeDataByName('midnight', isDarkMode);
    case ColorThemesEnum.mosqueCyan:
      return getThemeDataByName('mosqueCyan', isDarkMode);
    case ColorThemesEnum.ohMandyRed:
      return getThemeDataByName('ohMandyRed', isDarkMode);
    case ColorThemesEnum.outerSpace:
      return getThemeDataByName('outerSpace', isDarkMode);
    case ColorThemesEnum.pinkSakura:
      return getThemeDataByName('pinkSakura', isDarkMode);
    case ColorThemesEnum.purpleBrown:
      return getThemeDataByName('purpleBrown', isDarkMode);
    case ColorThemesEnum.redBlue:
      return getThemeDataByName('redBlue', isDarkMode);
    case ColorThemesEnum.redTornado:
      return getThemeDataByName('redTornado', isDarkMode);
    case ColorThemesEnum.redWine:
      return getThemeDataByName('redWine', isDarkMode);
    case ColorThemesEnum.rosewood:
      return getThemeDataByName('rosewood', isDarkMode);
    case ColorThemesEnum.rustDeepOrange:
      return getThemeDataByName('rustDeepOrange', isDarkMode);
    case ColorThemesEnum.sanJuanBlue:
      return getThemeDataByName('sanJuanBlue', isDarkMode);
    case ColorThemesEnum.sharkOrange:
      return getThemeDataByName('sharkOrange', isDarkMode);
    case ColorThemesEnum.thunderbirdRed:
      return getThemeDataByName('thunderbirdRed', isDarkMode);
    case ColorThemesEnum.verdunGreen:
      return getThemeDataByName('verdunGreen', isDarkMode);
    case ColorThemesEnum.verdunLime:
      return getThemeDataByName('verdunLime', isDarkMode);
    case ColorThemesEnum.vesuviusBurned:
      return getThemeDataByName('vesuviusBurned', isDarkMode);
    case ColorThemesEnum.willowWasabi:
      return getThemeDataByName('willowWasabi', isDarkMode);
    case ColorThemesEnum.yukonGoldYellow:
      return getThemeDataByName('yukonGoldYellow', isDarkMode);
    default:
      return getThemeDataByName('blueDelight', isDarkMode);
  }
}
