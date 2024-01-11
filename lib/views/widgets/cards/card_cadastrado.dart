import 'package:flutter/material.dart';

import '../../../config/assets/assets_path.dart';
import '../../../models/contato/contato_model.dart';
import '../cs_icon.dart';
import '../cs_icon_button.dart';
import '../cs_informacoes.dart';

class CardCadastrado extends StatelessWidget {
  const CardCadastrado({
    required this.contato,
    this.editar,
    this.deletar,
    this.icon,
    super.key,
  });

  final ContatoModel contato;

  final Widget? icon;
  final void Function()? editar;
  final void Function()? deletar;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 3,
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 0, right: 25, left: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CsIconButton(
                  icon: const CsIcon(icon: Icons.edit, color: Color.fromARGB(255, 17, 110, 185)),
                  onPressed: editar,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 0, right: 0, left: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CsIconButton(
                  icon: const CsIcon(icon: Icons.delete, color: Color.fromARGB(255, 207, 48, 36)),
                  onPressed: deletar,
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.all(20),
            child: Row(
              children: [
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.grey,
                      child: CircleAvatar(
                        backgroundColor: Colors.purple.withOpacity(0.2),
                        radius: 49,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.asset(AssetsPath.USER, fit: BoxFit.fill, width: double.infinity),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 20),
                Flexible(
                  child: CsInformacoes(
                    nome: contato.nome!,
                    numero: contato.telefone!,
                    email: contato.email!,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
