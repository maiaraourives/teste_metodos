import 'package:flutter/material.dart';

class CsIcon extends StatelessWidget {
  const CsIcon({
    required this.icon,
    this.size = 24,
    this.color,
    super.key,
  });

  final IconData? icon;
  final Color? color;
  final double size;

  @override
  Widget build(BuildContext context) {
    final Color color = this.color ?? Colors.purple;

    return Icon(
      icon,
      size: size,
      color: color,
    );
  }
}
