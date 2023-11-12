import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:prova_flutter/app/commons/vibrate/vibrate.dart';
import 'package:prova_flutter/app/modules/auth/login/validator/input_validator.dart';

import 'package:vibration/vibration.dart';


import '../../../../commons/widgets/custom_container.dart';
import '../../../../commons/widgets/custom_politica_privacidade.dart';
import '../widgets/custom_login_button.dart';
import '../widgets/custom_text_form_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _userController = TextEditingController();
  final _senhaController = TextEditingController();

  String? loginError;
  String? senhaError;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _userController.dispose();
    _senhaController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final vibrate = Vibrate();
    return Scaffold(

      body: Center(
        child: CustomContainer(
          child: Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(),
                CustomTextFormFieldLogin(
                  labelText: 'Usuário',
                  icon: Icon(Icons.person),
                  controller: _userController,
                  validator: (value) {
                    setState(() {
                      loginError = InputValidator.validateLogin(value);
                    });
                    return null; // Não exibe a mensagem de erro aqui
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                CustomTextFormFieldLogin(
                  labelText: 'Senha',
                  icon: Icon(Icons.lock),
                  controller: _senhaController,
                  validator: (value) {
                    setState(() {
                      senhaError = InputValidator.validateSenha(value);
                    });
                    return null; // Não exibe a mensagem de erro aqui
                  },
                ),
                SizedBox(height: 20,),
                if (loginError != null)
                  Text(
                    loginError!,
                    style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                if (senhaError != null)
                  Text(
                    senhaError!,
                    style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                SizedBox(height: 20),
                CustomLoginButton(
                  onPressed: () async {
                    // Realizar validação antes de prosseguir
                    String? loginError = InputValidator.validateLogin(_userController.text);
                    String? senhaError = InputValidator.validateSenha(_senhaController.text);

                    setState(() {
                      this.loginError = loginError;
                      this.senhaError = senhaError;
                    });

                    if (loginError == null && senhaError == null) {
                      // Ambos os campos são válidos, você pode prosseguir aqui
                      // Exemplo: Navegar para a próxima tela ou realizar a lógica de autenticação
                      print('Campos válidos! Realize a ação desejada.');
                      Modular.to.pushNamedAndRemoveUntil('/home', (p0) => false);
                    } else {
                      // Exibir mensagens de erro
                      if (loginError != null) {
                        print('Erro no campo de Login: $loginError');
                      }
                      if (senhaError != null) {
                        print('Erro no campo de Senha: $senhaError');
                      }

                      // Acionar a vibração
                      await vibrate.vibrate();
                    }
                  },
                  buttonText: 'Entrar',
                ),
                Spacer(),
                CustomPoliticaPrivacidade(),
               // SizedBox(height: 20,),
              ],

            ),
          ),
        ),
      ),
    );
  }
}

