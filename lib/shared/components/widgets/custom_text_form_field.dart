import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    Key? key,
    required this.controller,
    required this.keyboard,
    required this.validate,
    this.onSubmit,
    this.onchange,
    this.onTap,
    required this.label,
    this.isClickable = true,
    required this.prefixIcon,
    this.suffixPressed,
    this.suffixIcon,
    this.isPassword = false,
    // this.colorBorder,
    this.colorIcon,
  });

  TextEditingController controller;
  TextInputType keyboard;
  String? Function(String?)? validate;
  void Function(String)? onSubmit;
  void Function(String)? onchange;
  void Function()? onTap;
  String label;
  bool isClickable = true;
  dynamic prefixIcon;
  void Function()? suffixPressed;
  dynamic suffixIcon;
  bool isPassword = false;
  Color? colorIcon;

  // Color? colorBorder;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboard,
      obscureText: isPassword,
      enabled: isClickable,
      onFieldSubmitted: onSubmit,
      onChanged: onchange,
      onTap: onTap,
      cursorColor: Colors.teal,
      validator: validate,
      decoration: InputDecoration(
        labelStyle: const TextStyle(color: Colors.teal),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.teal)),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.green)),
        labelText: label,
        prefixIcon: Icon(
          prefixIcon,
          color: colorIcon,
        ),
        suffixIcon: IconButton(
          icon: Icon(suffixIcon),
          onPressed: suffixPressed,
        ),
        border: const OutlineInputBorder(),
      ),
    );
  }
}
