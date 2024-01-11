// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'visualizar_cadastros_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$VisualizarCadastrosState on _VisualizarCadastrosState, Store {
  Computed<ObservableList<ContatoModel>>? _$contatoComputed;

  @override
  ObservableList<ContatoModel> get contato => (_$contatoComputed ??=
          Computed<ObservableList<ContatoModel>>(() => super.contato,
              name: '_VisualizarCadastrosState.contato'))
      .value;
  Computed<bool>? _$loadingComputed;

  @override
  bool get loading => (_$loadingComputed ??= Computed<bool>(() => super.loading,
          name: '_VisualizarCadastrosState.loading'))
      .value;
  Computed<bool>? _$hasInternetComputed;

  @override
  bool get hasInternet =>
      (_$hasInternetComputed ??= Computed<bool>(() => super.hasInternet,
              name: '_VisualizarCadastrosState.hasInternet'))
          .value;
  Computed<bool>? _$hasErrorComputed;

  @override
  bool get hasError =>
      (_$hasErrorComputed ??= Computed<bool>(() => super.hasError,
              name: '_VisualizarCadastrosState.hasError'))
          .value;
  Computed<bool>? _$finishLoadingComputed;

  @override
  bool get finishLoading =>
      (_$finishLoadingComputed ??= Computed<bool>(() => super.finishLoading,
              name: '_VisualizarCadastrosState.finishLoading'))
          .value;

  late final _$_contatoAtom =
      Atom(name: '_VisualizarCadastrosState._contato', context: context);

  @override
  ObservableList<ContatoModel> get _contato {
    _$_contatoAtom.reportRead();
    return super._contato;
  }

  @override
  set _contato(ObservableList<ContatoModel> value) {
    _$_contatoAtom.reportWrite(value, super._contato, () {
      super._contato = value;
    });
  }

  late final _$_loadingAtom =
      Atom(name: '_VisualizarCadastrosState._loading', context: context);

  @override
  bool get _loading {
    _$_loadingAtom.reportRead();
    return super._loading;
  }

  @override
  set _loading(bool value) {
    _$_loadingAtom.reportWrite(value, super._loading, () {
      super._loading = value;
    });
  }

  late final _$_hasInternetAtom =
      Atom(name: '_VisualizarCadastrosState._hasInternet', context: context);

  @override
  bool get _hasInternet {
    _$_hasInternetAtom.reportRead();
    return super._hasInternet;
  }

  @override
  set _hasInternet(bool value) {
    _$_hasInternetAtom.reportWrite(value, super._hasInternet, () {
      super._hasInternet = value;
    });
  }

  late final _$_hasErrorAtom =
      Atom(name: '_VisualizarCadastrosState._hasError', context: context);

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

  late final _$_finishLoadingAtom =
      Atom(name: '_VisualizarCadastrosState._finishLoading', context: context);

  @override
  bool get _finishLoading {
    _$_finishLoadingAtom.reportRead();
    return super._finishLoading;
  }

  @override
  set _finishLoading(bool value) {
    _$_finishLoadingAtom.reportWrite(value, super._finishLoading, () {
      super._finishLoading = value;
    });
  }

  late final _$_VisualizarCadastrosStateActionController =
      ActionController(name: '_VisualizarCadastrosState', context: context);

  @override
  void addAllContato(List<ContatoModel> contato) {
    final _$actionInfo = _$_VisualizarCadastrosStateActionController
        .startAction(name: '_VisualizarCadastrosState.addAllContato');
    try {
      return super.addAllContato(contato);
    } finally {
      _$_VisualizarCadastrosStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeContato(ContatoModel contato) {
    final _$actionInfo = _$_VisualizarCadastrosStateActionController
        .startAction(name: '_VisualizarCadastrosState.removeContato');
    try {
      return super.removeContato(contato);
    } finally {
      _$_VisualizarCadastrosStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLoading({required bool value}) {
    final _$actionInfo = _$_VisualizarCadastrosStateActionController
        .startAction(name: '_VisualizarCadastrosState.setLoading');
    try {
      return super.setLoading(value: value);
    } finally {
      _$_VisualizarCadastrosStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setHasInternet({required bool value}) {
    final _$actionInfo = _$_VisualizarCadastrosStateActionController
        .startAction(name: '_VisualizarCadastrosState.setHasInternet');
    try {
      return super.setHasInternet(value: value);
    } finally {
      _$_VisualizarCadastrosStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setHasError({required bool value}) {
    final _$actionInfo = _$_VisualizarCadastrosStateActionController
        .startAction(name: '_VisualizarCadastrosState.setHasError');
    try {
      return super.setHasError(value: value);
    } finally {
      _$_VisualizarCadastrosStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setFinishLoading({required bool value}) {
    final _$actionInfo = _$_VisualizarCadastrosStateActionController
        .startAction(name: '_VisualizarCadastrosState.setFinishLoading');
    try {
      return super.setFinishLoading(value: value);
    } finally {
      _$_VisualizarCadastrosStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetPage() {
    final _$actionInfo = _$_VisualizarCadastrosStateActionController
        .startAction(name: '_VisualizarCadastrosState.resetPage');
    try {
      return super.resetPage();
    } finally {
      _$_VisualizarCadastrosStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
contato: ${contato},
loading: ${loading},
hasInternet: ${hasInternet},
hasError: ${hasError},
finishLoading: ${finishLoading}
    ''';
  }
}
