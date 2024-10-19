import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final IconData? icon;
  final String? hintText;
  final String? labelText;
  final String? helperText;
  final String? errorText;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final bool obscureText;
  final InputBorder? border;
  final TextStyle? errorStyle;
  final IconData? suffixIcon;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final VoidCallback? onSuffixIconTap; 
  const InputField({
    super.key,
    this.icon,
    this.hintText,
    this.labelText,
    this.helperText,
    this.errorText,
    this.controller,
    this.validator,
    this.obscureText = false,
    this.border,
    this.errorStyle,
    this.suffixIcon,
    this.focusNode,
    this.textInputAction,
    this.onSuffixIconTap, 
  });

  @override
  Widget build(BuildContext context) {
    ThemeData appTheme = Theme.of(context);
    return TextFormField(
      controller: controller,
      validator: validator,
      obscureText: obscureText,
      focusNode: focusNode,
      style: TextStyle(color: appTheme.colorScheme.onSecondary),
      textInputAction: textInputAction,
      decoration: InputDecoration(
        prefixIcon: icon != null
            ? Icon(
                icon,
                color: appTheme.colorScheme.onSecondary,
              )
            : null,
        hintText: hintText,
        hintStyle: TextStyle(color: appTheme.colorScheme.onSecondary),
        suffixIcon: suffixIcon != null
            ? GestureDetector(
                onTap: onSuffixIconTap,
                child: Icon(
                  suffixIcon,
                  color: appTheme.colorScheme.onSecondary,
                ),
              )
            : null,
        labelText: labelText,
        helperText: helperText,
        errorText: errorText,
        border: border ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
        filled: true,
        fillColor: appTheme.colorScheme.onPrimaryFixed,
        errorStyle: errorStyle ?? TextStyle(color: appTheme.colorScheme.error),
      ),
    );
  }
}
