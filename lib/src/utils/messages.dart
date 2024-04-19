import 'package:get/get.dart';

/// `Messages` class extends [Translations] and is responsible for combining
/// multiple translation maps into a single map. It provides a convenient way
/// to manage translations in Flutter applications using the GetX package.
/// Example Usage:
///
/// ```dart
/// void main() {
///   // Example translation maps
///   List<Map<String, Map<String, String>>> translationMaps = [
///     {'en_US': {'hello': 'Hello', 'world': 'World'}},
///     {'es_ES': {'hello': 'Hola', 'world': 'Mundo'}},
///   ];
///
///   // Using Messages class in GetMaterialApp
///   runApp(
///     GetMaterialApp(
///       translations: Messages(translationMaps),
///       // Other GetMaterialApp configurations...
///     ),
///   );
/// }
/// ```
class Messages extends Translations {
  /// List of translation maps to be combined into a single map.
  final List<Map<String, Map<String, String>>> translations;

  /// Constructor for the `Messages` class.
  ///
  /// Takes a list of [translations] as a parameter, which should contain
  /// individual translation maps. These maps will be combined into a single
  /// map to be used as the keys for translations in the application.
  Messages(this.translations);

  /// Overrides the [keys] getter from [Translations] to provide the
  /// combined translation keys.
  ///
  /// This method iterates through the list of translation maps, combines
  /// them, and returns a single map of keys that will be used for translations
  /// in the application.
  @override
  Map<String, Map<String, String>> get keys {
    var combinedKeys = <String, Map<String, String>>{};

    for (var map in translations) {
      map.forEach((key, value) {
        if (combinedKeys.containsKey(key)) {
          combinedKeys[key] = {...combinedKeys[key]!, ...value};
        } else {
          combinedKeys[key] = value;
        }
      });
      // print('translations = ${JsonEncoder().convert(translations)}');
    }

    return combinedKeys;
  }

  // @override
  // Map<String, Map<String, String>> get keys {
  //   var combinedKeys = <String, Map<String, String>>{};
  //   combinedKeys = _merge(translations);
  //   print('combinedKeys = ${JsonEncoder().convert(combinedKeys)}');
  //   return combinedKeys;
  // }

  // Map<String, Map<String, String>> _merge(
  //     List<Map<String, Map<String, String>>> translations) {
  //   var combinedKeys = <String, Map<String, String>>{};

  //   for (var map in translations) {
  //     map.forEach((key, value) {
  //       if (combinedKeys.containsKey(key)) {
  //         combinedKeys[key] = {...combinedKeys[key]!, ...value};
  //       } else {
  //         combinedKeys[key] = value;
  //       }
  //     });
  //   }

  //   return combinedKeys;
  // }
}
