import 'package:flutter/material.dart';
import 'package:dash_flags/dash_flags.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:get/instance_manager.dart';
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

class _LangSelectMenuState extends State<LangSelectMenu> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    final AppService appService = Get.find<AppService>();
    return DropdownButtonHideUnderline(
      child: Expanded(
        child: DropdownButton<String>(
          isExpanded: true,
          hint: Row(
            children: [
              // Flag mark
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
          // Drop-down menu item
          items: appService.supportedLanguages.map((entry) {
            String? langString = langEnumToStr(entry);

            // Generate a new string and add it to the list
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
        ),
      ),
    );
  }
}
