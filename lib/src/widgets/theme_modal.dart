import 'package:flutter/material.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:get/instance_manager.dart';
import '../enums/themes_enum.dart';
import '../app_service.dart';
import '../utils/theme.dart';
import 'colored_circle.dart';
import 'colorful_theme_icon.dart';

void showThemeModal(
  context, {
  double itemSize = 40,
  List<ColorThemesEnum> themes = const [],
}) {
  Rx<ColorThemesEnum> selectedTheme = ColorThemesEnum.blueDelight.obs;

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Center(
        child: SingleChildScrollView(
          child: AlertDialog(
            title: Text('app_service.select_theme'.tr),
            contentPadding: const EdgeInsets.all(16.0),
            content: Obx(
              () => Wrap(
                alignment: WrapAlignment.start,
                spacing: 8.0,
                runSpacing: 8.0,
                children: [
                  if (themes.isEmpty)
                    for (var theme in ColorThemesEnum.values)
                      ThemeItem(
                        theme: theme,
                        size: itemSize,
                        isSelected: selectedTheme.value == theme,
                        onSelected: (selected) {
                          selectedTheme.value = selected;
                        },
                      ),
                  if (themes.isNotEmpty)
                    ...themes.map((theme) => ThemeItem(
                          theme: theme,
                          size: itemSize,
                          isSelected: selectedTheme.value == theme,
                          onSelected: (selected) {
                            selectedTheme.value = selected;
                          },
                        ))
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('app_service.close'.tr),
              ),
            ],
          ),
        ),
      );
    },
  );
}

/// Color theme selection modal box
class ThemeModal extends StatefulWidget {
  final double itemSize;
  final List<ColorThemesEnum> themes;
  const ThemeModal({
    super.key,
    this.itemSize = 40,
    this.themes = const [],
  });

  @override
  State<StatefulWidget> createState() => ThemeModalState();
}

class ThemeModalState extends State<ThemeModal> {
  ColorThemesEnum selectedTheme = ColorThemesEnum.blueDelight;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectColor(context),
      child: const ColorfulThemeIcon(),
    );
  }

  /// Displaying color selection dialog box
  void selectColor(context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Center(
          child: SingleChildScrollView(
            child: AlertDialog(
              title: Text('app_service.select_theme'.tr),
              contentPadding: const EdgeInsets.all(16.0),
              content: Wrap(
                alignment: WrapAlignment.start,
                spacing: 8.0,
                runSpacing: 8.0,
                children: [
                  if (widget.themes.isEmpty)
                    for (var theme in ColorThemesEnum.values)
                      ThemeItem(
                        theme: theme,
                        size: widget.itemSize,
                        isSelected: selectedTheme == theme,
                        onSelected: (selected) {
                          setState(() {
                            selectedTheme = selected;
                          });
                        },
                      ),
                  if (widget.themes.isNotEmpty)
                    ...widget.themes.map((theme) => ThemeItem(
                          theme: theme,
                          size: widget.itemSize,
                          isSelected: selectedTheme == theme,
                          onSelected: (selected) {
                            setState(() {
                              selectedTheme = selected;
                            });
                          },
                        ))
                ],
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('app_service.close'.tr),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class ThemeItem extends StatefulWidget {
  final ColorThemesEnum theme;
  final bool isSelected;
  final ValueChanged<ColorThemesEnum> onSelected;
  final double size;
  const ThemeItem({
    super.key,
    this.theme = ColorThemesEnum.blueDelight,
    this.isSelected = false,
    this.size = 40,
    required this.onSelected,
  });

  @override
  State<StatefulWidget> createState() => ThemeItemState();
}

class ThemeItemState extends State<ThemeItem> {
  @override
  Widget build(BuildContext context) {
    final AppService appService = Get.find<AppService>();
    ThemeData themeData = getThemeDataByEnum(widget.theme, false);

    return ColoredCircle(
      themeData: themeData,
      size: widget.size,
      isSelected: widget.isSelected,
      onTap: () {
        widget.onSelected.call(widget.theme);
        appService.setColorTheme(widget.theme);
      },
    );
  }
}
