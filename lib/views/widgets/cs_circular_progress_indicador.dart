import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class CsCircularProgressIndicador extends StatelessWidget {
  const CsCircularProgressIndicador({
    this.withMessage = false,
    this.message,
    this.color,
    this.margin,
    this.size = 35,
    super.key,
  });

  const CsCircularProgressIndicador.light({
    this.withMessage = false,
    this.message,
    this.margin,
    this.size = 30,
    super.key,
  }) : color = Colors.white;

  const CsCircularProgressIndicador.dark({
    this.withMessage = false,
    this.message,
    this.margin,
    this.size = 30,
    super.key,
  }) : color = null;

  final Color? color;
  final bool withMessage;
  final String? message;
  final EdgeInsetsGeometry? margin;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: margin,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            LoadingAnimationWidget.threeArchedCircle(
              color: Colors.purple.withOpacity(0.8),
              size: size,
            ),
            if (withMessage) ...[
              const SizedBox(height: 20),
              Text(
                message ?? 'Carregando Dados',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.purple,
                  fontSize: 16,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
