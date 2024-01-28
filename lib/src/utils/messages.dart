import 'package:get/get.dart';

class Messages extends Translations {
  final List<Map<String, Map<String, String>>> translations;

  Messages(
    this.translations,
  );

  @override
  Map<String, Map<String, String>> get keys {
    var combinedKeys = <String, Map<String, String>>{};

    /// 将所有的翻译文件放在这里组装
    for (var map in translations) {
      map.forEach((key, value) {
        if (combinedKeys.containsKey(key)) {
          combinedKeys[key] = {...combinedKeys[key]!, ...value};
        } else {
          combinedKeys[key] = value;
        }
      });
    }

    return combinedKeys;
  }
}