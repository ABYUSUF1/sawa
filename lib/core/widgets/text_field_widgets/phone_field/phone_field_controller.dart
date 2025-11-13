import 'package:flutter/material.dart';
import 'country.dart';

class PhoneFieldController {
  final TextEditingController _textController;
  final List<Country> supportedCountries;

  String _countryCode;

  PhoneFieldController({String countryCode = '+20', List<Country>? countries})
    : _textController = TextEditingController(),
      _countryCode = countryCode,
      supportedCountries =
          countries ??
          const [
            Country(flag: '🇪🇬', code: '+20', maxLength: 10),
            Country(flag: '🇸🇦', code: '+966', maxLength: 9),
            Country(flag: '🇦🇪', code: '+971', maxLength: 9),
            Country(flag: '🇶🇦', code: '+974', maxLength: 8),
            Country(flag: '🇰🇼', code: '+965', maxLength: 8),
          ];

  // Only expose what's actually needed
  TextEditingController get textController => _textController;
  String get countryCode => _countryCode;

  // The only getter that matters - ready-to-use phone number
  String get e164 {
    final raw = _textController.text;
    final normalized = raw.startsWith('0') ? raw.substring(1) : raw;
    return '$_countryCode$normalized';
  }

  String? validate() {
    final raw = _textController.text;
    final country = supportedCountries.firstWhere(
      (c) => c.code == _countryCode,
      orElse: () => supportedCountries.first,
    );

    if (raw.isEmpty) return 'Phone number is required';
    if (raw.length != country.maxLength) {
      return 'Phone number must be ${country.maxLength} digits';
    }
    return null;
  }

  bool get isValid => validate() == null;

  void setCountryCode(String code, {bool clear = true}) {
    _countryCode = code;
    if (clear) _textController.clear();
  }

  void clear() => _textController.clear();
  void dispose() => _textController.dispose();
}
