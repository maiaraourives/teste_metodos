import '../models/erros/generic_error_model.dart';

class ResponseHttpValidate {
  ///Responsável por validar todas as requisições realizadas pelo app
  ///
  ///Com base no `statusCode` gerado pela requisição, determina se uma exceção deve ser lançada.
  ///Caso contrário, a resposta gerada pela requisição será retornada normalmente
  ///
  ///Possui validação por cada `rota` específica, assim como uma validação geral para evitar possíveis erros
  static void validateResponse({
    required String? rota,
    required int statusCode,
  }) {
    //Chamar por último
    _validateGeneralResponse(statusCode, rota);
  }

  ///Verifica erros genéricos, como por exemplo:
  ///* 401: Sessão expirada
  ///* < 200 ou > 200: Indicando falha na requisição
  static void _validateGeneralResponse(int statusCode, String? rota) {
    //Rota da requisição não encontrada
    if (statusCode == 404) {
      throw GenericErrorModel(
        titleErro: 'Erro',
        msgErro: 'O município/servidor informado não corresponde a um servidor válido do sistema.\nSe o problema persistir, por favor, contate o suporte.',
      );
    }

    if (statusCode == 429) {
      throw GenericErrorModel(
        titleErro: 'Atenção',
        msgErro: 'Muitas requisições foram realizadas nos últimos minutos e a sua operação foi bloqueada.\nPor favor, tente novamente mais tarde.',
      );
    }

    if (statusCode == 502) {
      throw GenericErrorModel(
        titleErro: 'Atenção',
        msgErro: 'O servidor está temporariamente fora do ar. Por favor, tente novamente mais tarde!\nSe o problema persistir, contate o suporte.',
      );
    }

    if (statusCode >= 500) {
      throw GenericErrorModel(
        titleErro: 'Atenção',
        msgErro: 'O servidor está enfrentando problemas temporariamente. Por favor, tente novamente mais tarde!\nSe o problema persistir, contate o suporte.',
      );
    }

    //Erros desconhecidos (tratamento genérico)
    if (statusCode < 200 || statusCode > 200) {
      throw GenericErrorModel(
        titleErro: 'Erro desconhecido',
        msgErro: 'Ocorreu um erro desconhecido e não foi possível prosseguir com a sua solicitação.\nSe o problema persistir, por favor, contate o suporte!',
      );
    }
  }
}
