import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// Verdun Lime（维尔登绿）亮色主题
ThemeData verdunLimeLightTheme = FlexThemeData.light(
  scheme: FlexScheme.limeM3, // 使用维尔登绿方案
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

// Verdun Lime（维尔登绿）暗色主题
ThemeData verdunLimeDarkTheme = FlexThemeData.dark(
  scheme: FlexScheme.limeM3, // 使用维尔登绿方案
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
