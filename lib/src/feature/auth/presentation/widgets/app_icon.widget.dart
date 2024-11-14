import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppIcon extends StatelessWidget {
  final String? name;
  final double? width;
  final double? height;
  final Color? color;

  const AppIcon(
      this.name, {
        super.key,
        this.width,
        this.height,
        this.color,
      });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/icons/$name.svg',
      width: width,
      height: height,
      color: color,
    );
  }
}
