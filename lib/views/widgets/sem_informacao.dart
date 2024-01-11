// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../config/assets/assets_path.dart';


///Exibe uma view indicando que a pesquisa não retornou nenhum dado
class SemInformacao extends StatefulWidget {
  const SemInformacao({
    required this.message,
    super.key,
  });

  final String message;

  @override
  _SemInformacaoState createState() => _SemInformacaoState();
}

class _SemInformacaoState extends State<SemInformacao> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: const Duration(seconds: 1, milliseconds: 300),
      vsync: this,
    );

    controller.repeat(reverse: true);

    animation = Tween(begin: 0.0, end: 1.0).animate(controller)..addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              AssetsPath.USER,
              width: 150,
              height: 150,
              colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
            ),
            const SizedBox(height: 10),
            Text(
              widget.message,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 22,
                color: Colors.purple,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
