import 'package:dash_flags/dash_flags.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_settings_ui/flutter_settings_ui.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:get/instance_manager.dart';
import '../../app_service.dart';
import '../utils/lang.dart';

class CupertinoLanguageSelectPage extends StatefulWidget {
  static const String url = '/language-select-page';
  final SettingsThemeData? settingsThemeData;

  const CupertinoLanguageSelectPage({
    super.key,
    this.settingsThemeData,
  });

  @override
  State<CupertinoLanguageSelectPage> createState() =>
      _CupertinoLanguageSelectPageState();
}

class _CupertinoLanguageSelectPageState
    extends State<CupertinoLanguageSelectPage> {
  @override
  Widget build(BuildContext context) {
    final AppService appService = Get.find<AppService>();

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('app_service.select_language'.tr),
      ),
      child: SafeArea(
        child: SettingsList(
          applicationType: ApplicationType.cupertino,
          lightTheme: widget.settingsThemeData,
          darkTheme: widget.settingsThemeData,
          platform: DevicePlatform.iOS,
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
                      ? const Icon(CupertinoIcons.check_mark_circled_solid,
                          color: CupertinoColors.systemBlue)
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
