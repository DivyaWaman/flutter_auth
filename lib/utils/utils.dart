import 'package:flutter/material.dart';

class Utils {
  static passValidation({
    required bool isPassField,
    required String? value,
    required String label,
    required TextEditingController passC,
    required TextEditingController cPassC,
  }) {
    if (isPassField) {
      RegExp regex =
          RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~])');
      if (value!.isEmpty) {
        return 'Please enter password';
      } else {
        if (value.length < 8) {
          return "Password must contian at least 8 characters";
        } else {
          return null;
        }
      }
    } else {
      if (value!.isEmpty) {
        return "Please enter confirm password";
      } else {
        if (passC.text != cPassC.text) {
          return "Password Mismatch";
        } else {
          return null;
        }
      }
    }
  }
}
