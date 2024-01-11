// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:dio/dio.dart';

import '../models/erros/error_model.dart';
import '../models/sessao/sessao_model.dart';
import '../utils/response_validate.dart';
import 'internet_service.dart';
import 'service_locator.dart';

class HttpService {
  static final _session = getIt<SessaoModel>();

  ///Responsável por fazer requisições do tipo `GET`
  ///
  ///Utilize a propriedade [url] quando desejar usar um link completo, sem interferências da base url selecionada
  static Future<dynamic> get({
    required String? rota,
    String? url,
    Map? params,
    Map? headers,
    bool validResponse = true,
    bool useToken = true,
  }) async {
    //Se não houver conexão com a internet, não é realizado a tentativa da requisição
    if (!await hasInternet()) {
      throw ErrorModel.internet();
    }

    try {
      String? urlRequest;
      if (url == null) {
        urlRequest = '${_session.servidor!.url}$rota';
      } else {
        urlRequest = url;
      }

      final dio = Dio();

      if (useToken) {
        try {
          //Automaticamente adiciona o token a requisição
          headers ??= {}; //Caso seja nulo, cria um map vazio
          // headers.addAll({HttpHeaders.authorizationHeader: await retornaJWT()});
        } catch (_) {}
      }

      if (headers != null) {
        headers.addAll({
          HttpHeaders.acceptHeader: 'application/json',
        });
      }

      Response response = await dio.get(
        urlRequest,
        queryParameters: params?.cast(),
        options: Options(
          headers: headers?.cast(),
          followRedirects: false,
          contentType: 'application/json',
          maxRedirects: 0,
          method: 'GET',
          validateStatus: (status) {
            return (status ?? 404) < 400;
          },
        ),
      );

      if (validResponse) {
        ResponseValidate.validate(resp: response);
      }

      return response.data;
    } on DioError catch (err) {
      if (validResponse) {
        ResponseValidate.validateDioError(error: err, rota: rota);
      }
    } catch (_) {
      rethrow;
    }
  }

  ///Responsável por fazer requisições do tipo `POST`
  ///
  ///Utilize a propriedade [url] quando desejar usar um link completo, sem interferências da base url selecionada
  static Future<dynamic> post({
    required String? rota,
    String? url,
    dynamic body,
    Map? params,
    Map? headers,
    bool validResponse = true,
    bool useToken = true,
  }) async {
    //Se não houver conexão com a internet, não é realizado a tentativa da requisição
    if (!await hasInternet()) {
      throw ErrorModel.internet();
    }

    try {
      String urlRequest;
      if (url == null) {
        urlRequest = '${_session.servidor!.url}$rota';
      } else {
        urlRequest = url;
      }

      final dio = Dio();

      if (useToken) {
        try {
          //Automaticamente adiciona o token a requisição
          headers ??= {}; //Caso seja nulo, cria um map vazio
          // headers.addAll({HttpHeaders.authorizationHeader: await retornaJWT()});
        } catch (_) {}
      }

      Response response = await dio.post(
        urlRequest,
        data: body,
        queryParameters: params?.cast(),
        options: Options(
          headers: headers?.cast(),
          followRedirects: false,
          contentType: 'application/json',
          maxRedirects: 0,
          method: 'POST',
          validateStatus: (status) {
            return (status ?? 404) < 400;
          },
        ),
      );

      if (validResponse) {
        ResponseValidate.validate(resp: response);
      }

      return response.data;
    } on DioError catch (err) {
      if (validResponse) {
        ResponseValidate.validateDioError(error: err, rota: rota!);
      }
    } catch (_) {
      rethrow;
    }
  }

  ///Faz uma requisição `GET` para download de um arquivo
  ///
  ///Utilize a propriedade [url] quando desejar usar um link completo, sem interferências da base url selecionada na tela de login
  static Future<void> downloadFile({
    required String rota,
    required File file,
    String? url,
  }) async {
    //Se não houver conexão com a internet, não é realizado a tentativa da requisição
    if (!await hasInternet()) {
      throw ErrorModel.internet();
    }

    try {
      String urlRequest;
      if (url == null) {
        urlRequest = '${_session.servidor!.url}$rota';
      } else {
        urlRequest = url;
      }

      final dio = Dio();

      await dio.download(
        urlRequest,
        file.path,
        options: Options(
          method: 'GET',
          validateStatus: (status) {
            return (status ?? 404) < 400;
          },
        ),
        deleteOnError: true,
      );
    } on DioError catch (err) {
      ResponseValidate.validateDioError(error: err, rota: rota);
    } catch (_) {
      rethrow;
    }
  }
}
