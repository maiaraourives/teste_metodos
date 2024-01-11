import 'errors_base_model.dart';

class SolicitacaoErrorModel extends Error implements ErrorBaseModel {
  SolicitacaoErrorModel({
    required String titleErro,
    required String msgErro,
  })  : _titleErro = titleErro,
        _msgErro = msgErro;

  final String _titleErro;
  final String _msgErro;

  @override
  String get titleErro => _titleErro;

  @override
  String get msgErro => _msgErro;
}
