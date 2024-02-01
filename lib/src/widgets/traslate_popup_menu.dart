import 'package:flutter/material.dart';
import 'package:dash_flags/dash_flags.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

import 'package:get_it/get_it.dart';

import '../../app_service.dart';
import '../utils/lang.dart';

/// Language selection menu
class LangSelectMenu extends StatefulWidget {
  const LangSelectMenu({
    super.key,
  });

  @override
  State<StatefulWidget> createState() => _LangSelectMenuState();
}

/// 状态类用于[LangSelectMenu]小部件。
class _LangSelectMenuState extends State<LangSelectMenu> {
  String? selectedValue; // 选中的值

  @override
  Widget build(BuildContext context) {
    final AppService appService = GetIt.instance.get<AppService>();
    return DropdownButtonHideUnderline(
      child: Expanded(
        child: DropdownButton<String>(
          isExpanded: true,
          hint: Row(
            children: [
              // 国旗标记
              CountryFlag(
                country: Country.fromCode(
                  getCountryCode(appService.currentLangStr),
                ),
                height: 14,
              ),
              const Spacer(),
              Text(
                'app_service.lang.${appService.currentLangStr}'.tr,
                style: const TextStyle(
                  fontSize: 14,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const Spacer(),
            ],
          ),
          value: selectedValue,
          onChanged: (String? value) {
            setState(() {
              selectedValue = value;
            });
            LanguageEnum? langEnum = strToLangEnum(value!);
            if (langEnum != null) {
              appService.updateLocale(langEnum);
            }
          },
          // 下拉菜单项
          items: appService.supportedLanguages.map((entry) {
            String? langString = langEnumToStr(entry);

            // 生成新字符串并添加到列表
            return DropdownMenuItem<String>(
              alignment: AlignmentDirectional.centerStart,
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
        ),
      ),
    );
  }
}
