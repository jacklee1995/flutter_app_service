import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// Gold Sunset（金色日落）亮色主题
ThemeData goldSunsetLightTheme = FlexThemeData.light(
  scheme: FlexScheme.gold, // 使用金色调色板
  surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold, // 使用低级表面模式和底层脚手架
  blendLevel: 7, // 混合级别为7
  subThemesData: const FlexSubThemesData(
    useTextTheme: true,
    useM2StyleDividerInM3: true,
    filledButtonSchemeColor: SchemeColor.primaryContainer,
    elevatedButtonSchemeColor: SchemeColor.secondary,
    navigationRailSelectedLabelSchemeColor: SchemeColor.onSurface,
    navigationRailUnselectedLabelSchemeColor: SchemeColor.onSurface,
    navigationRailMutedUnselectedLabel: false,
    navigationRailSelectedIconSchemeColor: SchemeColor.onSurface,
    navigationRailUnselectedIconSchemeColor: SchemeColor.onSurface,
    navigationRailMutedUnselectedIcon: false,
    navigationRailIndicatorSchemeColor: SchemeColor.secondaryContainer,
    navigationRailIndicatorOpacity: 1.00,
    navigationRailBackgroundSchemeColor: SchemeColor.surface,
    navigationRailLabelType: NavigationRailLabelType.none,
  ),
  keyColors: const FlexKeyColors(
    useSecondary: true,
    useTertiary: true,
  ),
  visualDensity: FlexColorScheme.comfortablePlatformDensity, // 使用舒适的平台密度
  useMaterial3: true, // 使用Material3
  swapLegacyOnMaterial3: true, // 在Material3上切换传统主题
  // 若要使用Playground字体，请添加GoogleFonts包并取消注释以下行：
  // fontFamily: GoogleFonts.notoSans().fontFamily,
);

// Gold Sunset（金色日落）暗色主题
ThemeData goldSunsetDarkTheme = FlexThemeData.dark(
  scheme: FlexScheme.gold, // 使用金色调色板
  surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold, // 使用低级表面模式和底层脚手架
  blendLevel: 13, // 混合级别为13
  subThemesData: const FlexSubThemesData(
    useTextTheme: true,
    useM2StyleDividerInM3: true,
    filledButtonSchemeColor: SchemeColor.primaryContainer,
    elevatedButtonSchemeColor: SchemeColor.secondary,
    navigationRailSelectedLabelSchemeColor: SchemeColor.onSurface,
    navigationRailUnselectedLabelSchemeColor: SchemeColor.onSurface,
    navigationRailMutedUnselectedLabel: false,
    navigationRailSelectedIconSchemeColor: SchemeColor.onSurface,
    navigationRailUnselectedIconSchemeColor: SchemeColor.onSurface,
    navigationRailMutedUnselectedIcon: false,
    navigationRailIndicatorSchemeColor: SchemeColor.secondaryContainer,
    navigationRailIndicatorOpacity: 1.00,
    navigationRailBackgroundSchemeColor: SchemeColor.surface,
    navigationRailLabelType: NavigationRailLabelType.none,
  ),
  keyColors: const FlexKeyColors(
    useSecondary: true,
    useTertiary: true,
  ),
  visualDensity: FlexColorScheme.comfortablePlatformDensity, // 使用舒适的平台密度
  useMaterial3: true, // 使用Material3
  swapLegacyOnMaterial3: true, // 在Material3上切换传统主题
  // 若要使用Playground字体，请添加GoogleFonts包并取消注释以下行：
  // fontFamily: GoogleFonts.notoSans().fontFamily,
);
