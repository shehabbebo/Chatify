import 'package:flutter/material.dart';

class CustomFormtextfiled extends StatelessWidget {
  CustomFormtextfiled(
      {this.hintText, this.onChanged, this.obscureText = false});
  Function(String)? onChanged;
  String? hintText;
  bool? obscureText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText!,
      validator: (data) {
        if (data!.isEmpty) {
          return 'failed is required';
        }
      },
      onChanged: onChanged,
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.white),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
            color: Colors.white,
          )),
          border: OutlineInputBorder(
              borderSide: BorderSide(
            color: Colors.white,
          ))),
    );
  }
}
