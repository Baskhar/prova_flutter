


import 'package:flutter_modular/flutter_modular.dart';
import 'package:prova_flutter/app/modules/auth/login/screens/login_screen.dart';




class LoginModule extends Module {
  @override
  List<Bind> get binds => [

  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (_, __) => const LoginScreen()),
  ];
}