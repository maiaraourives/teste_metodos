class AtualizarCadastroValidator {
  static String? nome(String? nome) {
    if (nome!.isEmpty) {
      return 'O campo nome não pode estar vazio';
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
      return 'O campo telefone não pode estar vazio não pode estar vazio';
    }

    if (telefone.length != 11) {
      return 'O telefone deve ter 11 dígitos';
    }

    return null;
  }

  static String? email(String? email) {
    if (email!.isEmpty) {
      return 'O campo  E-mail não pode estar vazio';
    }

    return null;
  }
}
