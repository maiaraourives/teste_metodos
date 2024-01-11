import '../config/routes/web_routes.dart';
import '../models/contato/contato_model.dart';
import '../services/http_service.dart';
import '../services/service_locator.dart';

class ContatoRepository {
  static Future<Map> fetchContato(int page) async {
    Map params = {
      'pkUsuario': getIt<ContatoModel>().idContato,
      'page': page,
    };

    return await HttpService.get(
      rota: WebRoutes.BUSCAR_CONTATOS,
      params: params,
    );
  }

  static Future<Map> deleteContato(ContatoModel contato) async {
    Map body = {
      'pkContato': contato.idContato,
    };

    return await HttpService.post(
      rota: WebRoutes.DELETAR_CONTATO,
      body: body,
    );
  }

  static Future<Map> atualizarContato(ContatoModel contato) async {
    Map body = {
      'contato': {
        'pkContato': contato.idContato,
        'nome': contato.nome,
        'telefone': contato.telefone,
        'email': contato.email,
      }
    };

    return await HttpService.post(
      rota: WebRoutes.ATUALIZAR_CONTATO,
      body: body,
    );
  }

  static Future<Map> cadastrarContato(ContatoModel contato) async {
    Map body = {
      'contato': {
        'pkContato': contato.idContato,
        'nome': contato.nome,
        'telefone': contato.telefone,
        'email': contato.email,
      }
    };

    return await HttpService.post(
      rota: WebRoutes.CADASTRAR_CONTATO,
      body: body,
    );
  }
}
