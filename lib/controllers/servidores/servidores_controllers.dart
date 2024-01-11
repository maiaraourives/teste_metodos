import '../../interfaces/iservidores.dart';
import '../../models/erros/error_model.dart';
import '../../models/servidor/servidor_model.dart';
import '../../models/sessao/sessao_model.dart';
import '../../repository/servidores_repository.dart';
import '../../services/service_locator.dart';

class ServidoresController implements IServidores {
  @override
  Future<void> verificaServidor() async {
    Map response = await ServidoresRepository.buscarServidores();

    if (response['status'] != 'success') {
      throw ErrorModel(descricao: 'Municípios indisponíveis');
    }

    List data = response['data'];

    final servers = data.map((sv) => ServidorModel.fromWeb(sv)).toList(); 

    final sessao = getIt<SessaoModel>();
    sessao.setServidor(servers.first);
  }
}
