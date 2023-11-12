import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomPoliticaPrivacidade extends StatelessWidget {
  const CustomPoliticaPrivacidade({Key? key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final Uri _url = Uri.parse('https://www.google.com.br/');
        if (!await launchUrl(_url)) {
          // Exibe uma mensagem Snackbar
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Não foi possível acessar as políticas de privacidade'),
              duration: Duration(seconds: 3), // Ajuste a duração conforme necessário
            ),
          );
        }
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 15),
        child: Text('Política de Privacidade', style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
