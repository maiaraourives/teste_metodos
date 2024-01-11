import 'errors_base_model.dart';

class UsuarioBloqueadoErrorModel extends Error implements ErrorBaseModel {
  UsuarioBloqueadoErrorModel({
    required String titleErro,
    required String msgErro,
    required Map moreInfos,
  })  : _titleErro = titleErro,
        _msgErro = msgErro,
        _moreInfos = moreInfos;

  final String _titleErro;
  final String _msgErro;
  final Map _moreInfos;

  @override
  String get titleErro => _titleErro;

  @override
  String get msgErro => _msgErro;

  Map get moreInfos => _moreInfos;
}
