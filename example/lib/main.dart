import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:app_service/app_service.dart';

import 'app/injections.dart';

import 'app/router.dart';
import 'modules/home/home_view.dart';
import 'modules/home/home_tr.dart';

void main() async {
  Get.testMode = false;
  GetitInjection.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Future<void> onInit(BuildContext context) async {
    final appService = GetIt.instance.get<AppService>();
    await appService.init();
  }

  @override
  Widget build(BuildContext context) {
    final appService = GetIt.instance.get<AppService>();

    return GetMaterialApp(
      debugShowCheckedModeBanner: Get.testMode,
      title: switch (Get.locale?.languageCode) {
        'zh' => 'AppService 演示',
        'en' => 'AppService Demo',
        'fr' => 'AppService démonstration',
        'ja' => 'AppServiceデモ',
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
      locale: const Locale('zh', 'CN'),
      fallbackLocale: const Locale('en', 'US'),
      home: const HomeView(),
      onInit: () async {
        await onInit(context);
      },
    );
  }
}
