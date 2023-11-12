import 'package:flutter/material.dart';

class CustomTextFormFieldLogin extends StatelessWidget {
  CustomTextFormFieldLogin({super.key,required this.controller,required this.icon,required this.validator,required this.labelText});
  final  TextEditingController controller;
  final Widget icon;
  final String labelText;
  final String? Function(String?) validator;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 5),
          child: Text(labelText,style: TextStyle(color: Colors.white),),
        ),
        TextFormField(
          controller: controller,

          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 10),
              filled: true,
              fillColor: Colors.white,

            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide.none
            ),
            prefixIcon: icon,

            prefixIconColor: Colors.black,
          ),
          validator: validator,

        ),
      ],
    );
  }
}
