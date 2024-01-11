import '../../interfaces/icontato.dart';
import '../../models/contato/contato_model.dart';
import '../../repository/contato_repository.dart';
import '../../utils/request_utils.dart';

class ContatoController implements IContato {
  @override
  Future<List<ContatoModel>> fetchContato(int page) async {
    final response = await ContatoRepository.fetchContato(page);

    validaResponse(response);

    List data = response['data'];

    return data.map((e) => ContatoModel.fromWeb(e)).toList();
  }

  @override
  Future<void> deleteContato(ContatoModel contato) async {
    final response = await ContatoRepository.deleteContato(contato);

    validaResponse(response);
  }

  @override
  Future<void> atualizarContato(ContatoModel contato) async {
    final response = await ContatoRepository.atualizarContato(contato);

    validaResponse(response);
  }

  @override
  Future<int> cadastrarContato(ContatoModel contato) async {
    final response = await ContatoRepository.cadastrarContato(contato);

    validaResponse(response);

    return response['data'];
  }
}
