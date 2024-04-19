import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

// 蓝色愉悦（Blue Delight）亮色主题
ThemeData blueDelightLightTheme = FlexThemeData.light(
  scheme: FlexScheme.blue, // 使用蓝色调色板
  surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold, // 使用低级表面模式和底层脚手架
  blendLevel: 7, // 混合级别为7
  subThemesData: const FlexSubThemesData(
    blendOnLevel: 10, // 在混合级别10上混合
    blendOnColors: false, // 不在颜色上混合
    useTextTheme: true, // 使用文本主题
    useM2StyleDividerInM3: true, // 在Material 3中使用M2样式分隔符
  ),
  visualDensity: FlexColorScheme.comfortablePlatformDensity, // 使用舒适的平台密度
  useMaterial3: true, // 使用Material 3
  swapLegacyOnMaterial3: true, // 在Material 3上切换传统主题
);

// 蓝色愉悦（Blue Delight）暗色主题
ThemeData blueDelightDarkTheme = FlexThemeData.dark(
  scheme: FlexScheme.blue, // 使用蓝色调色板
  surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold, // 使用低级表面模式和底层脚手架
  blendLevel: 13, // 混合级别为13
  subThemesData: const FlexSubThemesData(
    blendOnLevel: 20, // 在混合级别20上混合
    useTextTheme: true, // 使用文本主题
    useM2StyleDividerInM3: true, // 在Material 3中使用M2样式分隔符
  ),
  visualDensity: FlexColorScheme.comfortablePlatformDensity, // 使用舒适的平台密度
  useMaterial3: true, // 使用Material 3
  swapLegacyOnMaterial3: true, // 在Material 3上切换传统主题
);
