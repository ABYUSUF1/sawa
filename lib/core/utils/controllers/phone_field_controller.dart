// phone_field_controller.dart
import 'package:flutter/material.dart';

import '../validators.dart';

class PhoneFieldController {
  /// Underlying text controller for the national part the user types.
  final TextEditingController textController;

  /// Country code like "+20"
  String countryCode;

  /// expected length (national significant number) per country code
  final Map<String, int> expectedLen;

  /// If this controller created its own TextEditingController, we dispose it.
  final bool _ownsController;

  PhoneFieldController({
    TextEditingController? controller,
    this.countryCode = '+20',
    Map<String, int>? expectedLenOverride,
  }) : textController = controller ?? TextEditingController(),
       _ownsController = controller == null,
       expectedLen =
           expectedLenOverride ??
           const {
             '+20': 10, // Egypt national (without leading 0): 1016795971 -> 10
             '+966': 9,
             '+971': 9,
             '+974': 8,
             '+965': 8,
           };

  /// Raw text user typed (may include leading 0)
  String get nationalRaw => textController.text.trim();

  /// Normalized (remove one leading 0 if present)
  String get nationalNormalized =>
      nationalRaw.startsWith('0') ? nationalRaw.substring(1) : nationalRaw;

  /// The final E.164 string ready to send to backend
  String get e164 => '$countryCode$nationalNormalized';

  /// The final E.164 string ready to send to backend
  String get e164WithoutPlus => '$countryCode$nationalNormalized'.substring(1);

  /// Validation wrapper that returns null if valid or an error message string.
  /// It delegates to your existing Validators (so you keep translations).
  String? validate() {
    final expected = expectedLen[countryCode] ?? 8;
    return Validators.validatePhone(
      nationalRaw,
      countryCode: countryCode,
      expectedLength: expected,
    );
  }

  /// Quick boolean validity
  bool get isValid => validate() == null;

  /// Change country code (and optionally clear text)
  void setCountryCode(String c, {bool clear = true}) {
    countryCode = c;
    if (clear) textController.clear();
  }

  void clear() {
    textController.clear();
  }

  /// Dispose if we own the TextEditingController
  void dispose() {
    if (_ownsController) textController.dispose();
  }
}
