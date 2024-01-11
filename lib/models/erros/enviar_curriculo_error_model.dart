import 'errors_base_model.dart';

class CurriculosErrorModel extends Error implements ErrorBaseModel {
  CurriculosErrorModel({
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
