import 'package:flutter/material.dart';

import 'package:dash_flags/dash_flags.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:get/instance_manager.dart';
import '../app_service.dart';
import '../enums/language_enum.dart';
import '../utils/lang.dart';

/// Language selection menu
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

class _WenState extends State<Wen> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    final AppService appService = Get.find<AppService>();
    return DropdownButtonHideUnderline(
      child: PopupMenuButton<String>(
        icon: widget.icon,
        itemBuilder: (context) => appService.supportedLanguages.map((entry) {
          String? langString = langEnumToStr(entry);

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
                // Language name
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
      ),
    );
  }
}
