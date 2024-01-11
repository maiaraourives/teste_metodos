import 'dart:typed_data';

class ServidorModel {
  ServidorModel.fromDatabase(Map data) {
    codigo = data['MUNICIPIO_CODIGO'];
    _url = data['URL_SERVIDOR'];
    nome = data['MUNICIPIO'];
    brasaoURL = data['BRASAO'];
  }

  ServidorModel.fromWeb(Map data) {
    codigo = data['Id'];
    _url = data['Link'];
    brasaoURL = data['Brasao'];
    nome = data['Nome'];
  }

  late final int codigo;
  late final String _url;
  late final String brasaoURL;
  late final String nome;
  Uint8List? brasaoFile;

  String get url {
    final uri = Uri.parse(_url);

    return uri.origin;
  }
}
