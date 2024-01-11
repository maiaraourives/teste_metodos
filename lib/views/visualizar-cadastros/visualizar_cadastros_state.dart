// ignore_for_file: library_private_types_in_public_api, prefer_final_fields

import 'package:mobx/mobx.dart';

import '../../../models/contato/contato_model.dart';

part 'visualizar_cadastros_state.g.dart';

class VisualizarCadastrosState = _VisualizarCadastrosState with _$VisualizarCadastrosState;

abstract class _VisualizarCadastrosState with Store {
  @observable
  ObservableList<ContatoModel> _contato = ObservableList();

  @observable
  bool _loading = false;

  @observable
  bool _hasInternet = true;

  @observable
  bool _hasError = false;

  int _page = 0;

  @observable
  bool _finishLoading = false;

  @computed
  ObservableList<ContatoModel> get contato => _contato;

  @computed
  bool get loading => _loading;

  @computed
  bool get hasInternet => _hasInternet;

  @computed
  bool get hasError => _hasError;

  int get page => _page;

  @computed
  bool get finishLoading => _finishLoading;

  @action
  void addAllContato(List<ContatoModel> contato) {
    _contato.addAll(contato);
  }

  @action
  void removeContato(ContatoModel contato) {
    _contato.remove(contato);
  }

  @action
  void setLoading({required bool value}) {
    if (!value) {
      Future.delayed(const Duration(milliseconds: 100), () {
        _loading = value;
      });
    } else {
      _loading = value;
    }

    if (value) {
      _hasInternet = true;
      _hasError = false;
    }
  }

  @action
  void setHasInternet({required bool value}) {
    _hasInternet = value;
  }

  @action
  void setHasError({required bool value}) {
    _hasError = value;
  }

  void setPage({required int value}) {
    _page = value;
  }

  void incPage() {
    _page++;
  }

  @action
  void setFinishLoading({required bool value}) {
    _finishLoading = value;
  }

  @action
  void resetPage() {
    _contato.clear();
    _loading = false;
    _hasInternet = true;
    _hasError = false;
    _page = 0;
    _finishLoading = false;
  }
}
