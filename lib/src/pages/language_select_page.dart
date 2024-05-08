import 'package:dash_flags/dash_flags.dart';
import 'package:flutter/material.dart';
import 'package:flutter_settings_ui/flutter_settings_ui.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:get/instance_manager.dart';
import '../../app_service.dart';
import '../utils/lang.dart';

class LanguageSelectPage extends StatefulWidget {
  // final SettingsThemeData? settingsThemeData;
  final DevicePlatform? platform;
  final ApplicationType applicationType;
  const LanguageSelectPage({
    super.key,
    // this.settingsThemeData,
    this.platform,
    this.applicationType = ApplicationType.material,
  });

  @override
  State<LanguageSelectPage> createState() => _LanguageSelectPageState();
}

class _LanguageSelectPageState extends State<LanguageSelectPage> {
  @override
  Widget build(BuildContext context) {
    final AppService appService = Get.find<AppService>();

    return Scaffold(
      appBar: AppBar(
        title: Text('app_service.select_language'.tr),
      ),
      body: SafeArea(
        child: SettingsList(
          // lightTheme: widget.settingsThemeData,
          // darkTheme: widget.settingsThemeData,
          platform: widget.platform,
          applicationType: widget.applicationType,
          sections: [
            SettingsSection(
              title: Text('app_service.language'.tr),
              tiles: appService.supportedLanguages.map((langEnum) {
                String? langString = langEnumToStr(langEnum);
                bool isSelected = appService.currentLang == langEnum;

                return SettingsTile(
                  title: Row(
                    children: [
                      CountryFlag(
                        country: Country.fromCode(
                          getCountryCode(langString!),
                        ),
                        height: 20,
                      ),
                      const SizedBox(width: 10),
                      Expanded(child: Text('app_service.lang.$langString'.tr)),
                    ],
                  ),
                  trailing: isSelected
                      ? Icon(Icons.check_circle,
                          color: Theme.of(context).colorScheme.secondary)
                      : null,
                  onPressed: (BuildContext context) {
                    appService.updateLocale(langEnum);
                    setState(() {});
                  },
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
