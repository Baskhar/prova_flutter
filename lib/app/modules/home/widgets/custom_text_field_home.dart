import 'package:flutter/material.dart';

class CustomTextFieldHome extends StatelessWidget {
  const CustomTextFieldHome({
    Key? key,
    required this.controller,
    required this.onEditingComplete,
    required this.focusNode,
  }) : super(key: key);
  final FocusNode focusNode;
  final TextEditingController controller;
  final VoidCallback onEditingComplete;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      focusNode: focusNode,
      decoration: InputDecoration(
        hintText: 'Digite seu Texto',
        hintStyle: TextStyle(
          color: Colors.black,
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 10),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide.none),
      ),
      textAlign: TextAlign.center,
      onEditingComplete: onEditingComplete,
    );
  }
}
