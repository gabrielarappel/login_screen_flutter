mixin ValidationsMixin {
  String? isEmpty(String? value, [String? message]) {
    if (!(value!.isNotEmpty)) {
      return message ?? "Por favor, insira um valor válido";
    }
    return null;
  }

  String? validateEmail(String? value, [String? menssage]) {
    final emailRegExp =
        RegExp(r'^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');

    if (!emailRegExp.hasMatch(value!)) {
      return menssage ?? 'Por favor, insira um e-mail válido';
    }
    return null;
  }

  String? combine(List<String? Function()> validatores) {
    for (final func in validatores) {
      final validation = func();
      if (validation != null) return validation;
    }
    return null;
  }

  String? moreThanSeven(String? value, [String? menssage]) {
    if ((value?.length ?? 0) < 8) {
      return menssage ?? 'No mínimo 8 caracteres';
    }
    return null;
  }
}
