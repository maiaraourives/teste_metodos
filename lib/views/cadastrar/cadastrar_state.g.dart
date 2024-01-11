// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cadastrar_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CadastrarState on _CadastrarState, Store {
  Computed<int>? _$buttonStateComputed;

  @override
  int get buttonState =>
      (_$buttonStateComputed ??= Computed<int>(() => super.buttonState,
              name: '_CadastrarState.buttonState'))
          .value;
  Computed<bool>? _$isDoneComputed;

  @override
  bool get isDone => (_$isDoneComputed ??=
          Computed<bool>(() => super.isDone, name: '_CadastrarState.isDone'))
      .value;
  Computed<bool>? _$hasErrorComputed;

  @override
  bool get hasError =>
      (_$hasErrorComputed ??= Computed<bool>(() => super.hasError,
              name: '_CadastrarState.hasError'))
          .value;
  Computed<bool>? _$houveAlteracoesComputed;

  @override
  bool get houveAlteracoes =>
      (_$houveAlteracoesComputed ??= Computed<bool>(() => super.houveAlteracoes,
              name: '_CadastrarState.houveAlteracoes'))
          .value;
  Computed<bool>? _$loadingHabilidadesComputed;

  @override
  bool get loadingHabilidades => (_$loadingHabilidadesComputed ??=
          Computed<bool>(() => super.loadingHabilidades,
              name: '_CadastrarState.loadingHabilidades'))
      .value;

  late final _$_buttonStateAtom =
      Atom(name: '_CadastrarState._buttonState', context: context);

  @override
  int get _buttonState {
    _$_buttonStateAtom.reportRead();
    return super._buttonState;
  }

  @override
  set _buttonState(int value) {
    _$_buttonStateAtom.reportWrite(value, super._buttonState, () {
      super._buttonState = value;
    });
  }

  late final _$_isDoneAtom =
      Atom(name: '_CadastrarState._isDone', context: context);

  @override
  bool get _isDone {
    _$_isDoneAtom.reportRead();
    return super._isDone;
  }

  @override
  set _isDone(bool value) {
    _$_isDoneAtom.reportWrite(value, super._isDone, () {
      super._isDone = value;
    });
  }

  late final _$_hasErrorAtom =
      Atom(name: '_CadastrarState._hasError', context: context);

  @override
  bool get _hasError {
    _$_hasErrorAtom.reportRead();
    return super._hasError;
  }

  @override
  set _hasError(bool value) {
    _$_hasErrorAtom.reportWrite(value, super._hasError, () {
      super._hasError = value;
    });
  }

  late final _$_houveAlteracoesAtom =
      Atom(name: '_CadastrarState._houveAlteracoes', context: context);

  @override
  bool get _houveAlteracoes {
    _$_houveAlteracoesAtom.reportRead();
    return super._houveAlteracoes;
  }

  @override
  set _houveAlteracoes(bool value) {
    _$_houveAlteracoesAtom.reportWrite(value, super._houveAlteracoes, () {
      super._houveAlteracoes = value;
    });
  }

  late final _$_loadingHabilidadesAtom =
      Atom(name: '_CadastrarState._loadingHabilidades', context: context);

  @override
  bool get _loadingHabilidades {
    _$_loadingHabilidadesAtom.reportRead();
    return super._loadingHabilidades;
  }

  @override
  set _loadingHabilidades(bool value) {
    _$_loadingHabilidadesAtom.reportWrite(value, super._loadingHabilidades, () {
      super._loadingHabilidades = value;
    });
  }

  late final _$_CadastrarStateActionController =
      ActionController(name: '_CadastrarState', context: context);

  @override
  void setHasError({required bool value}) {
    final _$actionInfo = _$_CadastrarStateActionController.startAction(
        name: '_CadastrarState.setHasError');
    try {
      return super.setHasError(value: value);
    } finally {
      _$_CadastrarStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIsDone({required bool value}) {
    final _$actionInfo = _$_CadastrarStateActionController.startAction(
        name: '_CadastrarState.setIsDone');
    try {
      return super.setIsDone(value: value);
    } finally {
      _$_CadastrarStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setHouveAlteracoes() {
    final _$actionInfo = _$_CadastrarStateActionController.startAction(
        name: '_CadastrarState.setHouveAlteracoes');
    try {
      return super.setHouveAlteracoes();
    } finally {
      _$_CadastrarStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setButtonState({required int state}) {
    final _$actionInfo = _$_CadastrarStateActionController.startAction(
        name: '_CadastrarState.setButtonState');
    try {
      return super.setButtonState(state: state);
    } finally {
      _$_CadastrarStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLoadingHabilidades({required bool value}) {
    final _$actionInfo = _$_CadastrarStateActionController.startAction(
        name: '_CadastrarState.setLoadingHabilidades');
    try {
      return super.setLoadingHabilidades(value: value);
    } finally {
      _$_CadastrarStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetState() {
    final _$actionInfo = _$_CadastrarStateActionController.startAction(
        name: '_CadastrarState.resetState');
    try {
      return super.resetState();
    } finally {
      _$_CadastrarStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
buttonState: ${buttonState},
isDone: ${isDone},
hasError: ${hasError},
houveAlteracoes: ${houveAlteracoes},
loadingHabilidades: ${loadingHabilidades}
    ''';
  }
}
