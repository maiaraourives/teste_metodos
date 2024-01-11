import '../models/erros/generic_error_model.dart';

void validaResponse<T>(Map response, [T? customError]) {
  if (!response['success']) {
    if (customError != null) {
      throw customError;
    }

    throw GenericErrorModel(titleErro: 'Atenção', msgErro: response['error']);
  }
}
