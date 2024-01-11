import '../../services/http_service.dart';
import '../config/routes/web_routes.dart';

class ServidoresRepository {
   static Future<Map> buscarServidores() async {
    Map response = await HttpService.get(
      rota: '',
      url: WebRoutes.SERVIDORES,
    );

    return response;
  }
}
