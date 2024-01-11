import 'package:flutter/material.dart';
import 'package:teste_metodos/views/widgets/cs_app_bar.dart';

import '../../config/routes/local_routes.dart';
import '../widgets/cs_button.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CsAppBar(title: 'Teste Métodos'),
      body: ListView(
        children: [
          CsButton(
            onTap: () => Navigator.pushNamed(context, LocalRoutes.CADASTRAR),
            title: 'Cadastrar',
          ),
          CsButton(
            onTap: () => Navigator.pushNamed(context, LocalRoutes.VISUALIZAR_CADASTROS),
            title: 'Visualizar cadastros',
          ),
        ],
      ),
    );
  }
}
