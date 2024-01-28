import 'package:flutter/material.dart';

import 'package:dash_flags/dash_flags.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

import 'package:get_it/get_it.dart';

import '../../app_service.dart';
import '../utils/lang.dart';

/// 语言选择菜单
class Wen extends StatefulWidget {
  final Widget icon;
  const Wen({
    super.key,
    this.icon = const Icon(
      Icons.translate,
      size: 20.0,
    ),
  });

  @override
  State<StatefulWidget> createState() => _WenState();
}

/// 状态类用于[Wen]小部件。
class _WenState extends State<Wen> {
  String? selectedValue; // 选中的值

  @override
  Widget build(BuildContext context) {
    final AppService appService = GetIt.instance.get<AppService>();
    return DropdownButtonHideUnderline(
      child: PopupMenuButton<String>(
        icon: widget.icon,
        itemBuilder: (context) => appService.supportedLanguages.map((entry) {
          String? langString = langEnumToStr(entry);

          // 生成新字符串并添加到列表
          return PopupMenuItem<String>(
            value: langString,
            child: Row(
              children: [
                CountryFlag(
                  country: Country.fromCode(
                    getCountryCode(langString!),
                  ),
                  height: 12,
                ),
                const SizedBox(width: 5),
                // 语言名称
                Text(
                  'app_service.lang.$langString'.tr,
                  style: const TextStyle(
                    fontSize: 14,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const Spacer(),
              ],
            ),
          );
        }).toList(),

        onSelected: (String? value) {
          selectedValue = value;
          LanguageEnum? langEnum = strToLangEnum(value!);
          if (langEnum != null) {
            appService.updateLocale(langEnum);
          }
        },
        // // 按钮样式数据
      ),
    );
  }
}
