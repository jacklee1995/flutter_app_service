import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app_service.dart';

/// Widget that toggles between dark and light icons based on the current theme mode.
class DarkIconToggle extends StatelessWidget {
  /// Icon to display in dark mode
  final Icon? darkIcon;

  /// Icon to display in light mode
  final Icon? lightIcon;

  /// Constructor for DarkIconToggle widget.
  const DarkIconToggle({
    super.key,
    this.darkIcon,
    this.lightIcon,
  });

  @override
  Widget build(BuildContext context) {
    final AppService appService = Get.find<AppService>();
    return Obx(
      () {
        final bool isDarkMode = appService.isDarkMode.value;

        return IconButton(
          onPressed: () => appService.toggleDarkMode(),
          icon: isDarkMode
              ? (lightIcon ?? const Icon(Icons.light_mode_outlined))
              : (darkIcon ?? const Icon(Icons.dark_mode_outlined)),
        );
      },
    );
  }
}
