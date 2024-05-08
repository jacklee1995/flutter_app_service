import 'package:app_service/app_service.dart';
import 'package:get/instance_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> initDependencies() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  Get.put<SharedPreferences>(prefs);

  // 应用管理
  Get.lazyPut<AppService>(
    () => AppService(
      Get.find<SharedPreferences>(),
      supportedLanguages: const [
        LanguageEnum.zh,
        LanguageEnum.zhHk,
        LanguageEnum.zhMO,
        LanguageEnum.zhTW,
        LanguageEnum.en,
        LanguageEnum.enUK,
        LanguageEnum.enUS,
        LanguageEnum.de,
        LanguageEnum.ru,
        LanguageEnum.uk,
        LanguageEnum.be,
        LanguageEnum.kk,
        LanguageEnum.sr,
        LanguageEnum.fr,
        LanguageEnum.ja,
        LanguageEnum.ko,
        LanguageEnum.ar,
      ],
    ),
    fenix: true,
  );
}
