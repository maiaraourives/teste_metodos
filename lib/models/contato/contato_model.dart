class ContatoModel {
  ContatoModel();

  ContatoModel.fromWeb(Map data) {
    _idContato = data['id_contato'];
    _nome = data['nome'];
    _telefone = data['telefone'];
    _email = data['email'];
  }
  
  int? _idContato;

  String? _nome;

  String? _telefone;

  String? _email;

  void setIdContato(int idContato) {
    _idContato = idContato;
  }

  int? get idContato => _idContato;

  void setNome(String nome) {
    _nome = nome;
  }

  String? get nome => _nome;

  void setTelefone(String telefone) {
    _telefone = telefone;
  }

  String? get telefone => _telefone;

  void setEmail(String email) {
    _email = email;
  }

  String? get email => _email;

  ContatoModel copyWith(ContatoModel contato) {
    return ContatoModel()
      ..setIdContato(contato.idContato!)
      ..setNome(contato.nome!)
      ..setEmail(contato.email!)
      ..setTelefone(contato.telefone!);
  }
}
