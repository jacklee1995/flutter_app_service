# App Service

> Current Version: v3.0.0

[中文文档](https://github.com/jacklee1995/flutter_app_service/blob/master/README_CN.md)

An application service based on [GetX](https://pub.dev/packages/get), which provides application-level management services, such as theme management, dark mode management and localization management.

![Alt text](https://raw.githubusercontent.com/jacklee1995/flutter_app_service/master/example/readme_images/studio64_5duUzsvaJV.gif)

![Alt text](https://raw.githubusercontent.com/jacklee1995/flutter_app_service/master/example/readme_images/example_wrJkq7TYlE.gif)

**Author:** [Jack Lee](https://github.com/jacklee1995/flutter_app_service/blob/master/README_CN.md)

**Email:** [291148484@163.com](291148484@163.com)

---

## 1. Getting Started

### 1.1 Install

You can install the latest version of **App Service** in your project using the `flutter pub add` command:

```shell
flutter pub add app_seivice
```

This will add `app_seivice` as a dependency in the `dependencies` section of your project's `pubspec.yaml` file and implicitly run `flutter pub get` once.

### 1.2 Managing App Service in dependency injection

In an actual project, there may be many dependencies to be managed besides AppService, so I like to create an injections.dart file to describe the dependencies.
The following example uses the [GetIt](https://pub.dev/packages/get_it) library to manage dependencies. You can also use other dependency management schemes, depending on your own habits.import 'package:app_service/app_service.dart';

```dart
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../singletons/app_service.dart';
import '../singletons/prefs.dart';

/// Dependency Injection based on the Get_it library.
class GetitInjection {
  static void init() {
    final GetIt i = GetIt.instance;

    i.registerSingletonAsync<SharedPreferences>(() => prefsInstance());

    i.registerLazySingleton<AppService>(() => appService(i)); 
  }
}

```

An example implementation of `app_service.dart` is as follows:

```dart
import 'package:app_service/app_service.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

AppService appService(GetIt i) {
  return AppService(
    // Starting from version `3.0.0`, AppService no longer instantiates SharedPreferences internally. Therefore, when creating an instance of AppService, you should pass the pre-created SharedPreferences as a required parameter to the constructor.
    i.get<SharedPreferences>(),
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
    defaultLang: LanguageEnum.zh,
  );
}
```

## 2.Theme Management

Theme management in application service is used to switch different color themes, and each theme contains two modes, namely dark mode and light mode.
There are many theme data generated by [flex_color_scheme](https://pub.dev/packages/flex_color_scheme) built into the library.

The following is the built-in theme table:

| Theme Name            | Light Theme                     | Dark Theme                     |
| --------------------- | ------------------------------- | ------------------------------ |
| amberBlue             | amberBlueLightTheme             | amberBlueDarkTheme             |
| aquaBlue              | aquaBlueLightTheme              | aquaBlueDarkTheme              |
| bahamaTrinidad        | bahamaTrinidadLightTheme        | bahamaTrinidadDarkTheme        |
| barossa               | barossaLightTheme               | barossaDarkTheme               |
| bigStoneTulip         | bigStoneTulipLightTheme         | bigStoneTulipDarkTheme         |
| blueDelight           | blueDelightLightTheme           | blueDelightDarkTheme           |
| blueStoneTeal         | blueStoneTealLightTheme         | blueStoneTealDarkTheme         |
| blueWhale             | blueWhaleLightTheme             | blueWhaleDarkTheme             |
| blumine               | blumineLightTheme               | blumineDarkTheme               |
| brandBlue             | brandBlueLightTheme             | brandBlueDarkTheme             |
| brownOrange           | brownOrangeLightTheme           | brownOrangeDarkTheme           |
| camaroneGreen         | camaroneGreenLightTheme         | camaroneGreenDarkTheme         |
| damaskLunar           | damaskLunarLightTheme           | damaskLunarDarkTheme           |
| deepBlueSea           | deepBlueSeaLightTheme           | deepBlueSeaDarkTheme           |
| deepPurple            | deepPurpleLightTheme            | deepPurpleDarkTheme            |
| dellGenoaGreen        | dellGenoaGreenLightTheme        | dellGenoaGreenDarkTheme        |
| ebonyClay             | ebonyClayLightTheme             | ebonyClayDarkTheme             |
| eggplantPurple        | eggplantPurpleLightTheme        | eggplantPurpleDarkTheme        |
| endeavourBlue         | endeavourBlueLightTheme         | endeavourBlueDarkTheme         |
| espressoCrema         | espressoCremaLightTheme         | espressoCremaDarkTheme         |
| flutterDash           | flutterDashLightTheme           | flutterDashDarkTheme           |
| goldSunset            | goldSunsetLightTheme            | goldSunsetDarkTheme            |
| greens                | greensLightTheme                | greensDarkTheme                |
| greenForest           | greenForestLightTheme           | greenForestDarkTheme           |
| greenJungle           | greenJungleLightTheme           | greenJungleDarkTheme           |
| greenMoney            | greenMoneyLightTheme            | greenMoneyDarkTheme            |
| greyLaw               | greyLawLightTheme               | greyLawDarkTheme               |
| hippieBlue            | hippieBlueLightTheme            | hippieBlueDarkTheme            |
| indigoNight           | indigoNightLightTheme           | indigoNightDarkTheme           |
| indigoSanMarino       | indigoSanMarinoLightTheme       | indigoSanMarinoDarkTheme       |
| lipstickPink          | lipstickPinkLightTheme          | lipstickPinkDarkTheme          |
| mallardValencia       | mallardValenciaLightTheme       | mallardValenciaDarkTheme       |
| mangoMojito           | mangoMojitoLightTheme           | mangoMojitoDarkTheme           |
| material3             | material3LightTheme             | material3DarkTheme             |
| material3HighContrast | material3HighContrastLightTheme | material3HighContrastDarkTheme |
| material3Purple       | material3PurpleLightTheme       | material3PurpleDarkTheme       |
| midnight              | midnightLightTheme              | midnightDarkTheme              |
| mosqueCyan            | mosqueCyanLightTheme            | mosqueCyanDarkTheme            |
| ohMandyRed            | ohMandyRedLightTheme            | ohMandyRedDarkTheme            |
| outerSpace            | outerSpaceLightTheme            | outerSpaceDarkTheme            |
| pinkSakura            | pinkSakuraLightTheme            | pinkSakuraDarkTheme            |
| purpleBrown           | purpleBrownLightTheme           | purpleBrownDarkTheme           |
| redBlue               | redBlueLightTheme               | redBlueDarkTheme               |
| redTornado            | redTornadoLightTheme            | redTornadoDarkTheme            |
| redWine               | redWineLightTheme               | redWineDarkTheme               |
| rosewood              | rosewoodLightTheme              | rosewoodDarkTheme              |
| rustDeepOrange        | rustDeepOrangeLightTheme        | rustDeepOrangeDarkTheme        |
| sanJuanBlue           | sanJuanBlueLightTheme           | sanJuanBlueDarkTheme           |
| sharkOrange           | sharkOrangeLightTheme           | sharkOrangeDarkTheme           |
| thunderbirdRed        | thunderbirdRedLightTheme        | thunderbirdRedDarkTheme        |
| verdunGreen           | verdunGreenLightTheme           | verdunGreenDarkTheme           |
| verdunLime            | verdunLimeLightTheme            | verdunLimeDarkTheme            |
| vesuviusBurned        | vesuviusBurnedLightTheme        | vesuviusBurnedDarkTheme        |
| willowWasabi          | willowWasabiLightTheme          | willowWasabiDarkTheme          |
| yukonGoldYellow       | yukonGoldYellowLightTheme       | yukonGoldYellowDarkTheme       |

To switch themes, you can use the `setColorTheme` method of the **AppService** instance to toggle themes. The method signature is as follows:

```dart
void setColorTheme(ColorThemesEnum themeEnum)
```

For example:

```dart
// Get the AppService instance
final AppService appService = GetIt.instance.get<AppService>();

// Switch the theme to bigStoneTulip
appService.setColorTheme(ColorThemesEnum.bigStoneTulip);
```

#### ThemeModal

You can use the **ThemeModal** modal component to provide users with a more intuitive theme selection, for example:

```dart
const ThemeModal(),
```

It displays as a theme icon on the page:

![chrome_HM2hFfct9z](https://raw.githubusercontent.com/jacklee1995/flutter_app_service/master/example/readme_images/chrome_HM2hFfct9z.png)

If you touch or click on the icon, a dialog will appear to allow users to choose a theme:

![chrome_oPKRHK21u2](https://raw.githubusercontent.com/jacklee1995/flutter_app_service/master/example/readme_images/chrome_oPKRHK21u2.png)

Each theme is displayed in the modal as a circle with its `primaryColor`, and the selected theme has a checkmark next to its circle.

Since version `3.0.0`, you can specify available themes in the **ThemeModal** component using the `themes` parameter. If not specified or specified as an empty array, all built-in themes are used by default.

#### showThemeModal

Starting from this version, the `showThemeModal` method has been added. `showThemeModal` is a function that offers more flexibility in usage compared to **ThemeModal**. For example:

```dart
// onTap parameter of a certain component
onTap: (_) {
  showThemeModal(
    context,
    themes: [
      ColorThemesEnum.amberBlue,
      ColorThemesEnum.brownOrange,
      ColorThemesEnum.dellGenoaGreen,
      ColorThemesEnum.camaroneGreen,
    ],
  );
},
```

### Dark Mode Management

In the `App Service` library, Dark/Light mode is treated as two sub-states under the same theme, essentially defining two sets of corresponding theme data. You can directly toggle dark mode using the `toggleDarkMode` method in the AppService singleton:

```dart
// Get the AppService singleton
final AppService appService = GetIt.instance.get<AppService>();
// Toggle dark mode
appService.toggleDarkMode();
```

Additionally, on the instance object `appService`, there are methods `setDarkMode` and `setLightMode` for setting dark and light modes, respectively.

**DarkModeSwitch** is a toggle switch for dark mode that you can use directly in your code. In appearance, it looks like this:

![chrome_kVi5w711Re](https://raw.githubusercontent.com/jacklee1995/flutter_app_service/master/example/readme_images/chrome_kVi5w711Re.gif)

## 3. Localization

### 3.1 Message

**Messages** is a translation container that accepts a list, which can contain multiple translations. Its type signature is:

```dart
Messages Messages(
    List<Map<String, Map<String, String>>> translations
)
```

You should pass it into the **GetMaterialApp** top-level component via the `translations` parameter, and it must include a `AppServiceMessages().keys` in the list, which is a translation file for **App Service**. For example:

```dart
GetMaterialApp(
  translations: Messages([
    AppServiceMessages().keys,
    // Other translations
    HomeMessages().keys,
  ]),
);
```

Here, **HomeMessages** is a hypothetical custom translation file that looks like this:

```dart
import 'package:get/get.dart';

class HomeMessages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'zh_CN': {
          'home.appService_demo': 'AppService 演示',
        },
        'en': {
          'home.appService_demo': 'AppService Demo',
        },
        'ko_KR': {
          'home.appService_demo': 'AppService 데모',
        },
        'ja_JP': {
          'home.appService_demo': 'AppService デモ',
        },
        // More language translate...
      };
}
```

Certainly, depending on the project's needs, you can define more translation files and load them in the `translations` list of **Messages**.

When implementing internationalization, defining the supported languages is done by specifying the `supportedLanguages` parameter of the **AppService**. It accepts a list composed of multiple **LanguageEnum** enum values. **AppService** also needs to specify a default language. For example:

```dart
AppService appService = AppService(
  supportedLanguages: const [
    LanguageEnum.zh,
    LanguageEnum.en,
    LanguageEnum.fr,
  ],
  defaultLang: LanguageEnum.zh,
);
```

Here, the default value for `defaultLang` is *LanguageEnum.en*. This definition needs to correspond to the `locale` parameter in the top-level component.

The application title cannot be translated using the `.tr` provided by **GetX** because this method is not available before the initialization of the top-level component. This is especially evident in the localization switch effect on the **Web**:

![chrome_0ywly93CSl](https://raw.githubusercontent.com/jacklee1995/flutter_app_service/master/example/readme_images/chrome_0ywly93CSl.gif)

To achieve dynamic switching, you can use a `switch` statement, as shown in the example below:

```dart
import 'package:app_service/app_service.dart';

// ...
GetMaterialApp(
  // ...
  title: switch (Get.locale?.languageCode) {
    'zh' => 'AppService 演示',
    'en' => 'AppService Demo',
    'fr' => 'AppService démonstration',
    'ja' => 'AppServiceデモ',
    'ko' => 'App 서비스 데모',
    'ar' => 'تطبيق AppService',
    _ => 'AppService Demo',
  },
  translations: Messages([
    AppServiceMessages().keys,
    HomeMessages().keys,
  ]),
  locale: const Locale('zh', 'CN'),
  fallbackLocale: const Locale('en', 'US'),
  home: const HomeView(),
);

```

To switch languages, you can use the `updateLocale` method on the **AppService** instance. The method signature is:

```dart
void updateLocale(LanguageEnum newLanguage)
```

For example:

```dart
appService.updateLocale(LanguageEnum.zh);
```

### 3.2 Switching local language

There are two components available for displaying a language selection menu to switch the local language: **LangSelectMenu** and **Wen**.

#### 3.2.1 LangSelectMenu

**LangSelectMenu** is a regular square dropdown button, for example:

```dart
const LangSelectMenu(),
```

It looks like this:

![chrome_WBdxDZiVCG](https://raw.githubusercontent.com/jacklee1995/flutter_app_service/master/example/readme_images/chrome_WBdxDZiVCG.gif)

#### 3.2.2 Wen

**Wen** is also a button with a pop-up menu, but it is displayed with an icon, usually in the **Header**:

```dart
const Wen()
```

It looks like this:

![C844qQlH1K](https://raw.githubusercontent.com/jacklee1995/flutter_app_service/master/example/readme_images/C844qQlH1K.png)

You can customize the displayed icon, as well as the size of the icon, and it can be any widget.

#### 3.2.3 LanguageSelectPage & CupertinoLanguageSelectPage

If you want to choose a language in the settings page, you can consider using the **LanguageSelectPage or CupertinoLanguageSelectPage** widgets. Those widgetsis a language selection page that you can open from a settings item.

![1709576847626](https://github.com/jacklee1995/flutter_app_service/blob/master/example/readme_images/1709576847626.gif)

## 4. About Initialization

Initialization is used to read user data from persistent storage. The **AppService** instance provides an `init` method for its own initialization.

In your application, there are various ways to perform initialization. For example, the following code demonstrates initialization through the `onInit` method of the top-level component **GetMaterialApp**:

```dart
// ...
void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Future<void> onInit(BuildContext context) async {
    // Init AppService
    final appService = GetIt.instance.get<AppService>();
    await appService.init();
    // ...Other initializations
  }

  @override
  Widget build(BuildContext context) {
    final appService = GetIt.instance.get<AppService>();

    return GetMaterialApp(
      // ...
      onInit: () async {
        await onInit(context);
      },
    );
  }
}
```

## 5. Web App

In the Web App, the current [sharedPreferencesWeb](https://pub.dev/packages/shared_preferences_web) library utilizes [localStorage](https://developer.mozilla.org/en-US/docs/Web/API/Window/localStorage) for key-value pair storage. If there are changes to the relevant states managed by AppService, these changes will be directly reflected in the browser's localStorage:

![Alt text](https://raw.githubusercontent.com/jacklee1995/flutter_app_service/master/example/readme_images/chrome_aQ4vYWZSYM.gif)

## 6. Appendix

### About version

App Service

The App Service library depends on the following modules. Starting from version `3.0.0`, they are no longer built-in: GetX, GetIt. Therefore, you need to install them manually in your project.

You can install your preferred version, within the major version range, for GetX, GetIt:

| Library | Recommended Major Version |
| :------ | :------------------------ |
| GetX    | 4.6                       |
| GetIt   | 4.6                       |

Versions within a small difference are generally compatible.

### Enums

#### LanguageEnum

```dart
/// Enum representing different language codes.
enum LanguageEnum {
  zh,      // Chinese
  zhHans,  // Chinese (Simplified)
  zhHant,  // Chinese (Traditional)
  zhHk,    // Chinese (Hong Kong)
  zhTw,    // Chinese (Taiwan)
  ru,      // Russian
  de,      // German
  fr,      // French
  ja,      // Japanese
  ko,      // Korean
  es,      // Spanish
  ar,      // Arabic
  en,      // English
  enUs,    // English (United States)
  enUk,    // English (United Kingdom)
  pt,      // Portuguese
  it,      // Italian
  nl,      // Dutch
  tr,      // Turkish
  hi,      // Hindi
  id,      // Indonesian
  vi,      // Vietnamese
  th,      // Thai
  ms,      // Malay
  fil,     // Filipino
  sv,      // Swedish
  pl,      // Polish
  hu,      // Hungarian
  ro,      // Romanian
  cs,      // Czech
  el,      // Greek
  he,      // Hebrew
  da,      // Danish
  fi,      // Finnish
  no,      // Norwegian
  sk,      // Slovak
  sl,      // Slovenian
  bg,      // Bulgarian
  af,      // Afrikaans
  sq,      // Albanian
  hy,      // Armenian
  az,      // Azerbaijani
  eu,      // Basque
  bn,      // Bengali
  bs,      // Bosnian
  ca,      // Catalan
  hr,      // Croatian
  cy,      // Welsh
  et,      // Estonian
  tl,      // Filipino
  gl,      // Galician
  ka,      // Georgian
  gu,      // Gujarati
  ht,      // Haitian Creole
  ha,      // Hausa
  haw,     // Hawaiian
  iw,      // Hebrew
  jw,      // Javanese
  kk,      // Kazakh
  km,      // Khmer
  kn,      // Kannada
  ky,      // Kyrgyz
  lo,      // Lao
  la,      // Latin
  lv,      // Latvian
  lt,      // Lithuanian
  lb,      // Luxembourgish
  mk,      // Macedonian
  mg,      // Malagasy
  mt,      // Maltese
  mi,      // Maori
  mr,      // Marathi
  mn,      // Mongolian
  ne,      // Nepali
  ps,      // Pashto
  pa,      // Punjabi
  qu,      // Quechua
  gd,      // Scottish Gaelic
  sr,      // Serbian
  st,      // Sesotho
  sn,      // Shona
  sd,      // Sindhi
  si,      // Sinhala
  su,      // Sundanese
  sw,      // Swahili
  tg,      // Tajik
  ta,      // Tamil
  te,      // Telugu
  ur,      // Urdu
  uz,      // Uzbek
  xh,      // Xhosa
  yi,      // Yiddish
  zu,      // Zulu
}
```

#### ColorThemesEnum

```dart
/// Enum representing different color themes, including the name of each theme.
enum ColorThemesEnum {
  /// Amber Blue
  amberBlue,

  /// Aqua Blue
  aquaBlue,

  /// Bahama Trinidad
  bahamaTrinidad,

  /// Barossa
  barossa,

  /// Big Stone Tulip
  bigStoneTulip,

  /// Blue Delight
  blueDelight,

  /// Blue Stone Teal
  blueStoneTeal,

  /// Blue Whale
  blueWhale,

  /// Blumine
  blumine,

  /// Brand Blue
  brandBlue,

  /// Brown Orange
  brownOrange,

  /// Camarone Green
  camaroneGreen,

  /// Damask Lunar
  damaskLunar,

  /// Deep Blue Sea
  deepBlueSea,

  /// Deep Purple
  deepPurple,

  /// Dell Genoa Green
  dellGenoaGreen,

  /// Ebony Clay
  ebonyClay,

  /// Eggplant Purple
  eggplantPurple,

  /// Endeavour Blue
  endeavourBlue,

  /// Espresso Crema
  espressoCrema,

  /// Flutter Dash
  flutterDash,

  /// Gold Sunset
  goldSunset,

  /// Greens
  greens,

  /// Green Forest
  greenForest,

  /// Green Jungle
  greenJungle,

  /// Green Money
  greenMoney,

  /// Grey Law
  greyLaw,

  /// Hippie Blue
  hippieBlue,

  /// Indigo Night
  indigoNight,

  /// Indigo San Marino
  indigoSanMarino,

  /// Lipstick Pink
  lipstickPink,

  /// Mallard Valencia
  mallardValencia,

  /// Mango Mojito
  mangoMojito,

  /// Material3
  material3,

  /// Material3 High Contrast
  material3HighContrast,

  /// Material3 Purple
  material3Purple,

  /// Midnight
  midnight,

  /// Mosque Cyan
  mosqueCyan,

  /// Oh Mandy Red
  ohMandyRed,

  /// Outer Space
  outerSpace,

  /// Pink Sakura
  pinkSakura,

  /// Purple Brown
  purpleBrown,

  /// Red Blue
  redBlue,

  /// Red Tornado
  redTornado,

  /// Red Wine
  redWine,

  /// Rosewood
  rosewood,

  /// Rust Deep Orange
  rustDeepOrange,

  /// San Juan Blue
  sanJuanBlue,

  /// Shark Orange
  sharkOrange,

  /// Thunderbird Red
  thunderbirdRed,

  /// Verdun Green
  verdunGreen,

  /// Verdun Lime
  verdunLime,

  /// Vesuvius Burned
  vesuviusBurned,

  /// Willow Wasabi
  willowWasabi,

  /// Yukon Gold Yellow
  yukonGoldYellow,
}
```

#### Utils

##### Lang

```dart
/// Language enum value to string
String? langEnumToStr(LanguageEnum lang)
```

```dart
/// Convert the language logo to the corresponding country logo
String getCountryCode(String item)
```

```dart
/// Convert a language string to the corresponding language enum
LanguageEnum? strToLangEnum(String langStr)
```

##### Theme

```dart
/// Combine color themes with dark mode and return the corresponding ThemeData object.
/// - themeName: The name of the theme.
/// - isDarkMode: Whether to use dark mode.
ThemeData getThemeDataByName(String themeName, bool isDarkMode)
```

```dart
/// Get theme data (ThemeData) based on the enum.
ThemeData getThemeDataByEnum(ColorThemesEnum themeEnum, bool isDarkMode)
```

## 7. Issue Tracker

You can report issues on Github: https://github.com/jacklee1995/flutter_app_service/issues

## 8. licence

This project is licensed under the MIT License - see the [LICENSE](https://github.com/jacklee1995/flutter_app_service/blob/master/LICENSE) file for details.
