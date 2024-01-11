// ignore_for_file: prefer_final_fields, library_private_types_in_public_api

import 'package:mobx/mobx.dart';

import '../../../config/constants.dart';

part 'cadastrar_state.g.dart';

class CadastrarState = _CadastrarState with _$CadastrarState;

abstract class _CadastrarState with Store {
  @observable
  int _buttonState = ButtonState.SUBMIT;

  @observable 
  bool _isDone = false;

  @observable
  bool _hasError = false;

  @observable
  bool _houveAlteracoes = false;

  @observable
  bool _loadingHabilidades = true;

  @computed
  int get buttonState => _buttonState;

  @computed
  bool get isDone => _isDone;

  @computed
  bool get hasError => _hasError;

  @computed
  bool get houveAlteracoes => _houveAlteracoes;

  @computed
  bool get loadingHabilidades => _loadingHabilidades;

  @action
  void setHasError({required bool value}) {
    _hasError = value;
  }

  @action
  void setIsDone({required bool value}) {
    _isDone = value;
  }

  @action
  void setHouveAlteracoes() {
    _houveAlteracoes = true;
  }

  @action
  void setButtonState({required int state}) {
    _buttonState = state;

    if (state == ButtonState.LOADING) {
      _isDone = false;
      _hasError = false;
    }

    if (state == ButtonState.DONE) {
      _isDone = true;
    }
  }

  @action
  void setLoadingHabilidades({required bool value}) {
    _loadingHabilidades = value;
  }

  @action
  void resetState() {
    _buttonState = ButtonState.SUBMIT;
    _isDone = false;
    _hasError = false;
  }
}
