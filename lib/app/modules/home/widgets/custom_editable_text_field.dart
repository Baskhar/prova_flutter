import 'package:flutter/material.dart';

class CustomEditableTextField extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onTap;
  final ValueChanged<String> onSubmitted;
  final String initialText;
  final FocusNode focusNode;
  CustomEditableTextField({
    required this.controller,
    required this.focusNode,
    required this.onTap,
    required this.onSubmitted,
    required this.initialText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onTap: onTap,
      focusNode: focusNode,
      onSubmitted: onSubmitted,
      decoration: InputDecoration(
        border: InputBorder.none,
      ),
    );
  }
}
