import 'package:flutter/material.dart';

class CsIconButton extends StatelessWidget {
  const CsIconButton({
    required this.icon,
    this.splashRadius,
    this.onPressed,
    this.tooltip,
    this.size,
    this.splashColor,
    super.key,
  });

  final VoidCallback? onPressed;
  final String? tooltip;
  final Widget icon;
  final double? splashRadius;
  final double? size;
  final Color? splashColor;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      focusColor: Colors.purple,
      highlightColor: Colors.purple,
      onPressed: onPressed,
      splashRadius: 20,
      icon: icon,
      alignment: Alignment.center,
      tooltip: tooltip,
      iconSize: 10,
      splashColor: Colors.purple,
      color: Colors.blue,
    );
  }
}
