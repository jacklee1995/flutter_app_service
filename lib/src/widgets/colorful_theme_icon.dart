import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../svgs/color_style_svg.dart';

class ColorfulThemeIcon extends StatelessWidget {
  final double size;
  const ColorfulThemeIcon({
    super.key,
    this.size = 25.0,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: SvgPicture.string(
        colorStyleSvg,
        fit: BoxFit.cover,
      ),
    );
  }
}
