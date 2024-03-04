import 'package:flutter/material.dart';
import 'package:dash_flags/dash_flags.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:get_it/get_it.dart';
import '../../app_service.dart';
import '../utils/lang.dart';

class LanguageSelectPage extends StatefulWidget {
  static const String url = '/language-select-page';
  const LanguageSelectPage({super.key});

  @override
  State<LanguageSelectPage> createState() => _LanguageSelectPageState();
}

class _LanguageSelectPageState extends State<LanguageSelectPage> {
  @override
  Widget build(BuildContext context) {
    final AppService appService = GetIt.instance.get<AppService>();

    return Scaffold(
      appBar: AppBar(
        title: Text('app_service.select_language'.tr),
      ),
      body: ListView.builder(
        itemCount: appService.supportedLanguages.length,
        itemBuilder: (context, index) {
          LanguageEnum langEnum = appService.supportedLanguages[index];
          String? langString = langEnumToStr(langEnum);
          // Check if the language is the current language
          bool isSelected = appService.currentLang == langEnum;

          return ListTile(
            leading: CountryFlag(
              country: Country.fromCode(
                getCountryCode(langString!),
              ),
              height: 20,
            ),
            title: Text(
              'app_service.lang.$langString'.tr,
              style: const TextStyle(fontSize: 16),
            ),
            // Show check icon if selected
            trailing: isSelected
                ? Icon(Icons.check, color: Theme.of(context).primaryColor)
                : null,
            onTap: () {
              appService.updateLocale(langEnum);
              Navigator.pop(context);
            },
          );
        },
      ),
    );
  }
}
