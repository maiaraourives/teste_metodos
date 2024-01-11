class CadastrarValidator {
  static String? nome(String? nome) {
    if (nome!.isEmpty) {
      return 'Informe seu nome';
    }

    List<String> partsName = nome.split(' ');

    if (partsName.length == 1) {
      return 'Informe o seu nome completo';
    } else {
      if (partsName.length >= 2) {
        if (partsName[1].trim() == '') {
          return 'Informe o seu nome completo';
        }
      }
    }

    return null;
  }

  static String? telefone(String? telefone) {
    if (telefone!.isEmpty) {
      return 'Informe seu telefone';
    }

    if (telefone.length != 11) {
      return 'O telefone deve ter 11 dígitos';
    }

    return null;
  }

  static String? email(String? email) {
    if (email!.isEmpty) {
      return 'Informe seu email';
    }

    return null;
  }
}
