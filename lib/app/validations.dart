import 'package:flutter/cupertino.dart';

class Validations {
  static String? validateName(String name, BuildContext context) {
    String? validateString;
    Pattern pattern = r'[a-zA-Zء-ي]';
    RegExp regex = RegExp(pattern.toString());
    if (name.trim().isEmpty) {
      validateString = "empty field";
    } else if (!regex.hasMatch(name.trim()) && name.trim().length <= 15) {
      validateString = "Must be a valid name";
    }
    return validateString;
  }

  static String? validateEmail(String email, BuildContext context) {
    String? validateString;
    Pattern pattern =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    RegExp regex = RegExp(pattern.toString());
    if (email.trim().isEmpty) {
      validateString = "empty field";
    } else if (!regex.hasMatch(email.trim())) {
      validateString = "Must be a valid email";
    }
    return validateString;
  }

  static String? validatePhone(String phone, BuildContext context) {
    String? validateString;
    if (phone.trim().isEmpty) {
      validateString = "empty field";
    } else if (phone.trim().length != 11) {
      validateString = "Must be at 11 numbers";
    }
    return validateString;
  }

  static String? validatePassword(String password, BuildContext context) {
    String? validateString;
    if (password.trim().isEmpty) {
      validateString = "empty field";
    } else if (password.length < 3) {
      validateString = "Must be at least 3 numbers";
    }
    return validateString;
  }

  static String? validateConPassword(
      String password, BuildContext context, String conpass) {
    String? validateString;
    if (conpass.trim().isEmpty) {
      validateString = "emptyFailed";
    } else if (password.toString() != conpass.toString()) {
      validateString = "Both passwords must be match";
    }
    return validateString;
  }

  static String? validateField(String value, BuildContext context) {
    String? validateString;
    if (value.trim().isEmpty) {
      validateString = "empty field";
    }
    return validateString;
  }
}
