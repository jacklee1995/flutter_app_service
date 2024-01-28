import 'package:flutter/material.dart';

class HrV extends StatelessWidget {
  final double padding;
  final Color color;
  const HrV({
    super.key,
    this.padding = 9.0,
    this.color = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, padding, 0, padding),
      child: VerticalDivider(
        color: color,
        thickness: 1,
        width: 10,
      ),
    );
  }
}
