import 'package:flutter/material.dart';

class ColoredTextField extends StatelessWidget {
  const ColoredTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.icon,
    this.color = Colors.white,
    this.obscureText = false,
  }) : super(key: key);

  final TextEditingController controller;
  final Color color;
  final IconData? icon;
  final String hintText;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: color,
      autocorrect: false,
      enableSuggestions: false,
      obscureText: obscureText,
      style: TextStyle(color: color),
      decoration: InputDecoration(
        focusColor: color,
        hoverColor: color,
        icon: Icon(icon),
        iconColor: color,
        hintText: hintText,
        hintStyle: TextStyle(color: color),
        // focusedBorder: UnderlineInputBorder(
        //   borderSide: BorderSide(color: color),
        // ),
      ),
    );
  }
}
