class InputValidator {
  static String? validateLogin(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Campo de Login é obrigatório.';
    }

    if (value.length > 20) {
      return 'Campo de Login não pode ter mais de 20 caracteres.';
    }

    return null;
  }

  static String? validateSenha(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Campo de Senha é obrigatório.';
    }

    if (value.length < 2) {
      return 'A senha deve ter pelo menos dois caracteres.';
    }

    RegExp regExp = RegExp(r'^[a-zA-Z0-9]+$');
    if (!regExp.hasMatch(value)) {
      return 'A senha só pode conter letras de A a Z e números de 0 a 9.';
    }

    if (value.length > 20) {
      return 'Campo de Senha não pode ter mais de 20 caracteres.';
    }

    return null;
  }
}
