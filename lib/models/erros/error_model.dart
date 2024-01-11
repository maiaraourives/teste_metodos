import '/config/constants.dart';

class ErrorModel extends Error {
  ErrorModel({
    String? descricao,
    ErrorType type = ErrorType.generic,
  })  : _descricao = descricao,
        _type = type;

  ErrorModel.internet()
      : _descricao = 'Não há conexão com à internet. Verifique o seu wifi ou dados móveis',
        _type = ErrorType.internet;

  ErrorModel.http({
    required String descricao,
  })  : _descricao = descricao,
        _type = ErrorType.http_request;

  ErrorModel.sync({required String descricao})
      : _descricao = descricao,
        _type = ErrorType.sync;

  ErrorModel.gps({
    required String descricao,
  })  : _descricao = descricao,
        _type = ErrorType.gps;

  final String? _descricao;
  final ErrorType _type;

  String? get descricao => _descricao;

  ErrorType? get type => _type;
}
