// 页面配置工具集
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

import '../widgets/dark_mode_switch.dart';
import 'theme_modal.dart';
import 'traslate_popup_menu.dart';

class AppTools extends StatelessWidget {
  final double iconSize;
  final Widget icon;
  const AppTools({
    super.key,
    this.iconSize = 30,
    this.icon = const Icon(Icons.toggle_on_outlined),
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: iconSize,
      icon: icon,
      onPressed: () => showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('app_service.settings'.tr),
            content: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
            actions: <Widget>[
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: Theme.of(context).textTheme.labelLarge,
                ),
                child: Text('app_service.close'.tr),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
