import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:teste_metodos/views/widgets/cs_app_bar.dart';

import '../../config/routes/local_routes.dart';
import '../../controllers/contato/contato_controller.dart';
import '../../models/contato/contato_model.dart';
import '../../models/erros/no_internet_error_model.dart';
import '../../services/dialog_services.dart';
import '../widgets/cards/card_cadastrado.dart';
import '../widgets/cs_circular_progress_indicador.dart';
import '../widgets/sem_informacao.dart';
import 'visualizar_cadastros_state.dart';

class VisualizarCadastrosView extends StatefulWidget {
  const VisualizarCadastrosView({
    super.key,
  });

  @override
  State<VisualizarCadastrosView> createState() => _VisualizarCadastrosViewState();
}

class _VisualizarCadastrosViewState extends State<VisualizarCadastrosView> {
  final stateView = VisualizarCadastrosState();

  late ContatoModel contato;

  @override
  void initState() {
    super.initState();

    _fetchContato();
  }

  void _onDelete(ContatoModel contato) async {
    try {
      await ContatoController().deleteContato(contato);

      stateView.removeContato(contato);

      showSnackbar('Contato excluído', seconds: 2);
    } catch (_) {
      showSnackbar('Erro ao excluir contato', seconds: 2);
    }
  }

  void _fetchContato() async {
    try {
      stateView.setLoading(value: true);

      final contato = await ContatoController().fetchContato(stateView.page);

      if (contato.isEmpty) {
        stateView.setFinishLoading(value: true);
      } else {
        stateView.addAllContato(contato);
      }

      stateView.incPage();
    } on NoInternetErrorModel catch (_) {
      stateView.setHasInternet(value: false);
    } catch (_) {
      stateView.setHasError(value: true);
    } finally {
      stateView.setLoading(value: false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CsAppBar(title: 'Visualizar Cadastros'),
      body: Observer(
        builder: (_) {
          if (stateView.hasError) {
            return const SemInformacao(
              message: 'Aconteceu um erro inesperado. Por favor, tente novamente ou entre em contato com a equipe responsável.',
            );
          }

          if (stateView.contato.isEmpty && !stateView.loading) {
            return const SemInformacao(
              message: 'Nenhum currículo foi cadastrado',
            );
          }

          return ListView.builder(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.all(0),
            itemCount: stateView.contato.length + (stateView.loading ? 1 : 0),
            itemBuilder: (_, index) {
              if (index < stateView.contato.length) {
                final contato = stateView.contato[index];

                return CardCadastrado(
                  contato: contato,
                  deletar: () => _onDelete(contato),
                  editar: () => Navigator.pushNamed(contato as BuildContext, LocalRoutes.ATUALIZAR_CADASTROS),
                );
              }

              return const CsCircularProgressIndicador.dark(
                margin: EdgeInsets.all(5),
                size: 20,
              );
            },
          );
        },
      ),
    );
  }
}
