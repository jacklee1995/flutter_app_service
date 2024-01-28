import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import '../app_service.dart';

/// Color changeover switch
class DarkModeSwitch extends StatefulWidget {
  final double width;
  final double height;

  final double slideSize;

  final double borderWidth;
  final Color borderColor;

  final Duration duration;

  const DarkModeSwitch({
    super.key,
    this.width = 46.0,
    this.height = 25.0,
    this.slideSize = 21.0,
    this.borderWidth = 1.0,
    this.borderColor = Colors.grey,
    this.duration = const Duration(milliseconds: 300),
  });

  @override
  State<DarkModeSwitch> createState() => _DarkModeSwitchState();
}

class _DarkModeSwitchState extends State<DarkModeSwitch>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _rotateAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _rotateAnimation =
        Tween<double>(begin: 0.0, end: 2 * 3.1416).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final AppService appService = GetIt.instance.get<AppService>();

    return Obx(
      () {
        final bool isDarkMode = appService.isDarkMode.value;

        // icon
        IconData icon =
            isDarkMode ? Icons.dark_mode_outlined : Icons.light_mode;

        // Chute color
        Color? spoutColor = isDarkMode
            ? const Color.fromARGB(255, 73, 73, 73)
            : const Color.fromARGB(255, 226, 226, 226);

        // Slider color
        Color? sliderColor = isDarkMode
            ? const Color.fromARGB(255, 8, 8, 8)
            : const Color.fromARGB(255, 255, 255, 255);

        // Icon color
        Color iconColor = isDarkMode
            ? const Color.fromARGB(255, 182, 182, 182)
            : const Color.fromARGB(255, 118, 118, 118);

        // 滑块直径（确保滑块直径小于滑槽高度）

        if (isDarkMode) {
          _controller.forward();
        } else {
          _controller.reverse();
        }

        return GestureDetector(
          onTap: () => appService.toggleDarkMode(),
          // 滑槽级别
          child: Container(
            width: widget.width,
            height: widget.height,
            decoration: BoxDecoration(
              color: spoutColor,
              borderRadius: BorderRadius.circular(widget.height / 2), // 左右侧半圆形
              border: Border.all(
                color: widget.borderColor,
                width: widget.borderWidth,
              ),
            ),
            // 滑块级别（滑块+图标）
            child: Stack(
              alignment: Alignment.center,
              children: [
                // 位置平移动画（滑块）
                AnimatedPositioned(
                  duration: widget.duration,
                  curve: Curves.easeInOut,
                  left: isDarkMode ? widget.width - widget.slideSize - 4 : 2,
                  right: isDarkMode ? 2 : widget.width - widget.slideSize - 4,
                  child: AnimatedBuilder(
                    animation: _rotateAnimation,
                    builder: (_, child) {
                      // 旋转变换（图标）
                      return Transform.rotate(
                        angle: _rotateAnimation.value,
                        child: child,
                      );
                    },
                    child: AnimatedContainer(
                      duration: widget.duration,
                      width: widget.slideSize,
                      height: widget.slideSize,
                      decoration: BoxDecoration(
                        color: sliderColor,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        icon,
                        color: iconColor,
                        size: widget.slideSize - 10,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
