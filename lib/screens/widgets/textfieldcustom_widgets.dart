import 'package:flutter/material.dart';

class TextfieldCustomWidget extends StatelessWidget {
  const TextfieldCustomWidget({
    super.key,
    required this.labelText,
    required this.isValidTextfield,
    required this.errorMessage,
    this.suffixIcon,
    this.keyboardType = TextInputType.text,
    this.onChanged,
    this.isObscureText = false,
  });

  final String labelText;
  final bool isValidTextfield;
  final String errorMessage;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final Function(String)? onChanged;
  final bool isObscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      onChanged: onChanged,
      obscureText: isObscureText,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: labelText,
        errorText: isValidTextfield ? null : errorMessage,
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
