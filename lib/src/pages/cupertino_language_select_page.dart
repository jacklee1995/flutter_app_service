import 'package:dash_flags/dash_flags.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_settings_ui/flutter_settings_ui.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:get_it/get_it.dart';
import '../../app_service.dart';
import '../utils/lang.dart';

/// Make sure you have added the flutter_settings_ui dependency in your pubspec.yaml file.
/// ```yaml
/// dependencies:
///   flutter:
///     sdk: flutter
///   flutter_settings_ui: ^latest_version
/// ```
class CupertinoLanguageSelectPage extends StatefulWidget {
  const CupertinoLanguageSelectPage({super.key});

  @override
  State<CupertinoLanguageSelectPage> createState() =>
      _CupertinoLanguageSelectPageState();
}

class _CupertinoLanguageSelectPageState
    extends State<CupertinoLanguageSelectPage> {
  @override
  Widget build(BuildContext context) {
    final AppService appService = GetIt.instance.get<AppService>();

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('app_service.select_language'.tr),
      ),
      child: SafeArea(
        child: SettingsList(
          applicationType: ApplicationType.cupertino,
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
                    setState(
                        () {}); // Refresh the page to show the selected language
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
