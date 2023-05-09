import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class FormValidator {
  static RegExp emailRegex = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z\.]+\.(com|pk)+",
  );
  static RegExp creditCardNumberRegex = RegExp(
    r'^(?:4[0-9]{12}(?:[0-9]{3})?|5[1-5][0-9]{14})$',
  );

  static RegExp creditCardCVVRegex = RegExp(
    r'^[0-9]{3}$',
  );

  static RegExp creditCardExpiryRegex = RegExp(
    r'(0[1-9]|10|11|12)/[0-9]{2}$',
  );

  const FormValidator._();

  static String? emailValidator(String? email) {
    if (email == null || email.isEmpty) {
      return 'Please enter an email';
    } else if (!emailRegex.hasMatch(email)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  static String? creditCardNumberValidator(String? ccNumber) {
    if (ccNumber != null && creditCardNumberRegex.hasMatch(ccNumber))
      return null;
    return 'Invalid credit card number';
  }

  static String? creditCardCVVValidator(String? cvv) {
    if (cvv != null && creditCardCVVRegex.hasMatch(cvv)) return null;
    return 'Please enter a valid CVV';
  }

  /// A method containing validation logic for credit card expiry input.
  static String? creditCardExpiryValidator(String? expiry) {
    if (expiry != null && creditCardExpiryRegex.hasMatch(expiry)) return null;
    return 'Please enter a valid expiry date';
  }
}
