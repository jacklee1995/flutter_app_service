import 'package:flutter/material.dart';

class ColoredCircle extends StatelessWidget {
  final ThemeData themeData;
  final double size;
  final bool isSelected;
  final BoxShape shape;
  final Function()? onTap;

  const ColoredCircle({
    super.key,
    required this.themeData,
    required this.size,
    this.isSelected = false,
    this.shape = BoxShape.circle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: GestureDetector(
        onTap: () {
          onTap?.call();
        },
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: themeData.primaryColor,
          ),
          child: Center(
            child: isSelected
                ? const Icon(
                    Icons.check,
                    color: Colors.white,
                  )
                : null,
          ),
        ),
      ),
    );
  }
}
