import 'package:flutter/material.dart';
import 'aya_colors.dart';
import 'utils/colors.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final bool isPassword;

  const CustomTextField({
    required this.hintText,
    required this.controller,
    required this.keyboardType,
    this.validator,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: isPassword,
      validator: validator,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: AppColors.hintColor),
        prefixIcon: Icon(
          isPassword ? Icons.lock : Icons.person,
          color: AppColors.hintColor,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primaryColor),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
