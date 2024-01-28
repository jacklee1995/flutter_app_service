import 'package:app_service/app_service.dart';
import 'package:get_it/get_it.dart';

/// 基于 Get it 库的依赖注入
class GetitInjection {
  static void init() {
    final GetIt i = GetIt.instance;
    AppService appService = AppService(
      supportedLanguages: const [
        LanguageEnum.zh,
        LanguageEnum.zhHk,
        LanguageEnum.zhTw,
        LanguageEnum.en,
        LanguageEnum.fr,
        LanguageEnum.ja,
        LanguageEnum.ko,
        LanguageEnum.ar,
      ],
      defaultLang: LanguageEnum.zh,
    );
    i.registerLazySingleton<AppService>(() => appService); // 应用基础服务
  }
}