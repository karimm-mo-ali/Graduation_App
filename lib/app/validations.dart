import 'package:flutter/cupertino.dart';

class Validations {
  static String? validateName(String name, BuildContext context) {
    String? validateString = '';
    Pattern pattern = r'[a-zA-Zء-ي]';
    RegExp regex = RegExp(pattern.toString());
    if (name.trim().isEmpty) {
      validateString = "empty failed";
    } else if (!regex.hasMatch(name.trim()) && name.trim().length <= 15) {
      validateString = "invalid data";
    } else {
      validateString = null;
    }
    return validateString;
  }

  static String? validateEmail(String email, BuildContext context) {
    String? validateString;
    Pattern pattern =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    RegExp regex = RegExp(pattern.toString());
    if (email.trim().isEmpty) {
      validateString = "empty failed";
    } else if (!regex.hasMatch(email.trim())) {
      validateString = "invalid data";
    }
    return validateString;
  }

  static String? validatePassword(String password, BuildContext context) {
    String? validateString = '';
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regex = RegExp(pattern.toString());
    if (password.trim().isEmpty) {
      validateString = "empty failed";
    }
    /*else if (!regex.hasMatch(password.trim())) {
      validateString = "invalid data";
    }*/
    else if (password.length < 3) {
      validateString = "3 letters";
    }
    return validateString;
  }

  static String? validateField(String value, BuildContext context) {
    String? validateString = '';
    if (value.trim().isEmpty) {
      validateString = "empty failed";
    } else {
      validateString = null;
    }
    return validateString;
  }

  static String? validateconPassword(
      String password, BuildContext context, String conpass) {
    String? validateString = '';
    if (conpass.trim().isEmpty) {
      validateString = "empty failed";
    } else if (password.toString() != conpass.toString()) {
      validateString = "doesn't match";
    }
    return validateString;
  }
}
