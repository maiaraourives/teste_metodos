import '../models/contato/contato_model.dart';

abstract class IContato {
  Future<List<ContatoModel>> fetchContato(int page);

  Future<int> cadastrarContato(ContatoModel contato);

  Future<void> atualizarContato(ContatoModel contato);

  Future<void> deleteContato(ContatoModel contato);
}
