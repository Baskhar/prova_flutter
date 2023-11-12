import 'package:flutter/material.dart';

class CustomLoginButton extends StatelessWidget {
  const CustomLoginButton({
    Key? key,
    required this.onPressed,
    required this.buttonText,

  }) : super(key: key);

  final VoidCallback onPressed;
  final String buttonText;


  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0), // Cantos arredondados
        color: Color(0xFF44BD6E), // Cor do botão (#44BD6E)
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(buttonText),
        style: ElevatedButton.styleFrom(
          primary: Colors.transparent, // Deixe transparente para mostrar a cor do contêiner
          shadowColor: Colors.transparent, // Remova a sombra padrão
        ),
      ),
    );
  }
}
