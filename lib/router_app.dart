import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:teste_metodos/models/contato/contato_model.dart';

import 'views/atualizar-cadastro/atualizar_cadastro_view.dart';
import 'views/cadastrar/cadastrar_view.dart';
import 'config/routes/web_routes.dart';
import 'utils/fuctions_utils.dart';
import 'views/visualizar-cadastros/visualizar_cadastros_view.dart';
import 'views/widgets/cs_button.dart';
import 'config/routes/local_routes.dart';
import 'views/home/home_view.dart';
import 'views/widgets/cs_app_bar.dart';
import 'views/widgets/cs_error.dart';

class RouterApp {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case LocalRoutes.HOME:
        return _PageBuilder(
          child: const HomeView(),
          settings: settings,
        );

      case LocalRoutes.CADASTRAR:
        return _PageBuilder(
          child: const CadastrarView(),
          settings: settings,
        );

      case LocalRoutes.VISUALIZAR_CADASTROS:
        return _PageBuilder(
          child: const VisualizarCadastrosView(),
          settings: settings,
        );

      case LocalRoutes.ATUALIZAR_CADASTROS:
        final contato = ContatoModel();
        return _PageBuilder(
          child: AtualizarCadastroView(contato: contato),
          settings: settings,
        );

      default:
        return _PageBuilder(
          child: const _RotaInexistenteView(),
          settings: settings,
        );
    }
  }
}

class _PageBuilder extends PageRouteBuilder {
  ///Responsável pelo efeito de 'fade transition' entre as transições de telas
  _PageBuilder({
    required this.child,
    required this.settings,
  }) : super(
          settings: settings,
          transitionDuration: const Duration(milliseconds: 500),
          reverseTransitionDuration: const Duration(milliseconds: 100),
          transitionsBuilder: (context, animation, secAnimation, child) {
            MediaQueryData data = MediaQuery.of(context);

            return GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Observer(
                builder: (_) {
                  return MediaQuery(
                    data: data.copyWith(
                      alwaysUse24HourFormat: true,
                    ),
                    child: child,
                  );
                },
              ),
            );
          },
          pageBuilder: (context, animation, secAnimation) => child,
        );

  final Widget child;

  @override
  final RouteSettings settings;
}

class _RotaInexistenteView extends StatelessWidget {
  const _RotaInexistenteView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CsAppBar(title: 'Ops! Ocorreu um erro'),
      body: Center(
        child: SingleChildScrollView(
          child: CsError(
            text: 'Desculpe, a página que você está procurando não foi encontrada. Relate o seu problema abrindo um chamado no botão abaixo!',
            actions: [
              CsButton(
                title: 'Abrir chamado',
                onTap: () => launchURL(WebRoutes.URL_SOFTDESK),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
