# CHANGELOGS

## 4.0.1

### Fixes

- Fixed an issue where the initially selected theme in the theme selection modal did not match the actual initialized theme. Now, when opening the theme selection modal, the initially selected theme will be consistent with the theme currently used by the application.

## 4.0.0

### New Features

- Added functionality to follow the system's dark mode. Now, the application can automatically switch to dark mode based on the system's dark mode setting.
- Introduced the `isSystemDarkMode` property to indicate whether the current system is in dark mode.
- Introduced the `followSystem` property to control whether the application follows the system's dark mode. The default value is `true`, indicating it follows the system's dark mode.

### Improvements

- Optimized the switching logic for dark mode. When `followSystem` is `true`, the application will automatically update the dark mode state based on changes in the system's dark mode.
- Added logic to listen for changes in the system's dark mode within the `onInit` method. When the system's dark mode changes, if `followSystem` is `true`, the application will automatically update the dark mode state and save the settings.

### Miscellaneous

- Refactored some code to improve readability and maintainability.
- Updated documentation and comments to provide clearer explanations and examples.

## 3.0.1

### Add

- **DarkIconToggle**, a widget that toggles between dark and light icons based on the current theme mode.


## 3.0.0

### breake changes

Starting from version `3.0.0`, AppService no longer instantiates SharedPreferences internally. Therefore, when creating an instance of AppService, you should pass the pre-created SharedPreferences as a required parameter to the constructor.

### changes

An additional `themes` parameter has been added to **ThemeModal** to specify all available themes.

### Add

**showThemeModal** function, which is a function that offers more flexibility in usage compared to **ThemeModal**.

### Add

**LanguageSelectPage or CupertinoLanguageSelectPage** which is language selection page that you can open from a settings item.

# 2.0.0

- The revision of internationalization and localization functions is mainly the revision of some language labels.

# 1.0.0

- Initial version.

