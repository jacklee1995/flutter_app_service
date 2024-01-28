import 'package:app_service/app_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/hr_v.dart';

class HomeView extends StatelessWidget {
  static const String url = '/home';
  final String title = 'home.appService_demo';
  const HomeView({
    super.key,
    // required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title.tr),
        actions: const [
          HrV(),
          Wen(),
          HrV(),
          DarkModeSwitch(),
          HrV(),
          ThemeModal(),
        ],
      ),
      body: Center(
        child: SizedBox(
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('app_service.color_theme'.tr + 'app_service.:'.tr),
                  const ThemeModal(),
                ],
              ),
              const SizedBox(height: 6),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('app_service.dark_mode'.tr + 'app_service.:'.tr),
                  const DarkModeSwitch(),
                ],
              ),
              const SizedBox(height: 6),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('app_service.sys_lang'.tr + 'app_service.:'.tr),
                  const LangSelectMenu(),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: const AppTools(
        icon: Icon(Icons.settings),
      ),
    );
  }
}
