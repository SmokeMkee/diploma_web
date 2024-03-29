import 'package:diploma_web/constants/app_colors.dart';
import 'package:flutter/material.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({super.key,
    this.prefixIcon,
    this.hintText,
    this.suffixIcon,
    this.hintStyle,
    this.validator,
    this.obscureText = false,
    this.textEditingController,
    this.focusNode, this.errorText,});
  final String? errorText;
  final Widget? prefixIcon;
  final TextEditingController? textEditingController;
  final Widget? suffixIcon;
  final String? hintText;
  final TextStyle? hintStyle;
  final String? Function(String?)? validator;
  final bool obscureText;
  final FocusNode? focusNode;
  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(
        width: 2,
        color: AppColors.gray200,
      ),
    );
    final errorBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(
        width: 2,
        color: AppColors.error,
      ),
    );
    return TextFormField(
      focusNode:focusNode,
      obscureText: obscureText,
      controller: textEditingController,
      decoration: InputDecoration(
        enabledBorder: border,
        focusedBorder: border,
        errorBorder: errorBorder,
        focusedErrorBorder: errorBorder,
        hintText: hintText,
        hintStyle: hintStyle,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
      ),
      validator: validator,
      onSaved: (val) => textEditingController?.text = val ?? '',
    );
  }
}
