# 3.0.0

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
