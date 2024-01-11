// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sessao_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SessaoModel on _SessaoModel, Store {
  Computed<ServidorModel?>? _$servidorComputed;

  @override
  ServidorModel? get servidor =>
      (_$servidorComputed ??= Computed<ServidorModel?>(() => super.servidor,
              name: '_SessaoModel.servidor'))
          .value;

  late final _$_servidorAtom =
      Atom(name: '_SessaoModel._servidor', context: context);

  @override
  ServidorModel? get _servidor {
    _$_servidorAtom.reportRead();
    return super._servidor;
  }

  @override
  set _servidor(ServidorModel? value) {
    _$_servidorAtom.reportWrite(value, super._servidor, () {
      super._servidor = value;
    });
  }

  late final _$_SessaoModelActionController =
      ActionController(name: '_SessaoModel', context: context);

  @override
  void setServidor(ServidorModel? servidor) {
    final _$actionInfo = _$_SessaoModelActionController.startAction(
        name: '_SessaoModel.setServidor');
    try {
      return super.setServidor(servidor);
    } finally {
      _$_SessaoModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
servidor: ${servidor}
    ''';
  }
}
