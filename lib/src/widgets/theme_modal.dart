import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:get_it/get_it.dart';

import '../enums/themes_enum.dart';
import '../app_service.dart';
import '../svgs/color_style_svg.dart';
import '../utils/theme.dart';
import 'colored_circle.dart';

/// 颜色主题选择模态框
class ThemeModal extends StatefulWidget {
  final double itemSize;
  const ThemeModal({
    super.key,
    this.itemSize = 40,
  });

  @override
  State<StatefulWidget> createState() => ThemeModalState();
}

class ThemeModalState extends State<ThemeModal> {
  // 当前选中的主题
  ColorThemesEnum selectedTheme = ColorThemesEnum.blueDelight;
  Color selectedColor = Colors.black;
  bool isFirstDraw = true;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectColor(context),
      child: SizedBox(
        width: 25.0,
        height: 25.0,
        child: SvgPicture.string(
          colorStyleSvg,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  /// 显示颜色选择对话框的方法。
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
                  for (var theme in ColorThemesEnum.values)
                    ThemeItem(
                      theme: theme,
                      size: widget.itemSize,
                      isSelected: selectedTheme == theme, // 根据当前选中的主题来决定是否选中
                      onSelected: (selected) {
                        // 当主题被选中时，更新状态
                        setState(() {
                          selectedTheme = selected;
                        });
                      },
                    ),
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
  final bool isSelected; // 新增变量来接收是否被选中的状态
  final ValueChanged<ColorThemesEnum> onSelected; // 新增回调函数来在主题被选中时通知父组件
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
    final AppService appService = GetIt.instance.get<AppService>();
    ThemeData themeData = getThemeDataByEnum(widget.theme, false);

    return ColoredCircle(
      themeData: themeData,
      size: widget.size,
      isSelected: widget.isSelected, // 使用从父组件传递过来的状态来决定是否被选中
      onTap: () {
        widget.onSelected.call(widget.theme); // 当被点击时，调用回调函数通知父组件
        appService.setColorTheme(widget.theme);
      },
    );
  }
}
