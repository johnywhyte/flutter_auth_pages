import 'package:flutter/material.dart';

class PasswordTextFormField extends StatelessWidget {
  final bool obserText;
  final Function validator;
  final String name;
  final Function onTap;

  PasswordTextFormField(
      {this.obserText, this.validator, this.name, this.onTap});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obserText,
      validator: validator,
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: name,
          hintStyle: TextStyle(color: Colors.black),
          suffixIcon: GestureDetector(
            onTap: onTap,
            child: Icon(
                obserText == true ? Icons.visibility : Icons.visibility_off,
                color: Colors.black),
          )),
    );
  }
}
