// ignore_for_file: constant_identifier_names

class ButtonState {
  static const SUBMIT = 0;

  static const LOADING = 1;

  static const DONE = 2;
}

enum ErrorType {
  generic,
  internet,
  login,
  login_offline,
  http_request,
  session,
  sync,
  expiredToken,
  cadastro,
  gps,
}