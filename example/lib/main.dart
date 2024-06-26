import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app_service/app_service.dart';

import 'app/injections.dart';

import 'app/router.dart';
import 'modules/home/home_view.dart';
import 'modules/home/home_tr.dart';

void main() async {
  Get.testMode = true;

  WidgetsFlutterBinding.ensureInitialized();
  Get.testMode = kDebugMode;

  await initDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appService = Get.find<AppService>();

    return GetMaterialApp(
      debugShowCheckedModeBanner: Get.testMode,
      title: switch (Get.locale?.toLanguageTag()) {
        'zh' => 'AppService 演示 (zh)',
        'zh-CN' => 'AppService 演示（陆）',
        'zh-HK' => 'AppService 演示（港）',
        'zh-MO' => 'AppService 演示（澳）',
        'zh-TW' => 'AppService 演示（台）',
        'en' => 'AppService Demo (en)',
        'en-GB' => 'AppService Dem (GB)',
        'en-US' => 'AppService Demo (US)',
        'ru' => 'Демонстрация сервиса приложения',
        'ru-RU' => 'Демонстрация сервиса приложения',
        'ru-BY' => 'Дэма-версія паслугі',
        'ru-UA' => 'Демо-версія служби',
        'ru-KZ' => 'AppService Демо',
        'fr' => 'AppService démonstration (fr)',
        'ja' => 'AppServiceデモ (日)',
        'ko' => 'App 서비스 데모',
        'ar' => 'تطبيق AppService',
        _ => 'AppService Demo',
      },
      theme: appService.currentTheme,
      getPages: AppRoutes.routes,
      translations: Messages([
        AppServiceMessages().keys,
        HomeMessages().keys,
      ]),
      locale: Locale(appService.currentLangStr),
      fallbackLocale: const Locale('en', 'US'),
      home: const HomeView(),
    );
  }
}
