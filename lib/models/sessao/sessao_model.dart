// ignore_for_file: library_private_types_in_public_api, unused_element

import 'package:mobx/mobx.dart';

import '../servidor/servidor_model.dart';

part 'sessao_model.g.dart';

class SessaoModel = _SessaoModel with _$SessaoModel;

abstract class _SessaoModel with Store {
  _SessaoModel();

  @observable
  ServidorModel? _servidor;

  @action
  void setServidor(ServidorModel? servidor) {
    _servidor = servidor;
  }

  @computed
  ServidorModel? get servidor => _servidor;
}