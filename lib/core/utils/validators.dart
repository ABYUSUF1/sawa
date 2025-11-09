import 'package:easy_localization/easy_localization.dart';

class Validators {
  static String? validateEmpty(String? value) {
    if (value == null || value.isEmpty) {
      return "LocaleKeys.validators_required.tr()";
    }
    return null;
  }

  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return "LocaleKeys.validators_name_required.tr()";
    }
    if (value.length < 3) {
      return "LocaleKeys.validators_name_short.tr()";
    }

    // No Space allowed
    if (value.contains(' ')) {
      return "LocaleKeys.validators_name_no_space.tr()";
    }

    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "LocaleKeys.validators_email_required.tr()";
    }
    const emailRegex = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    if (!RegExp(emailRegex).hasMatch(value)) {
      return "LocaleKeys.validators_email_invalid.tr()";
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "LocaleKeys.validators_password_required.tr()";
    }
    if (value.length < 6) {
      return "LocaleKeys.validators_password_short.tr()";
    }
    return null;
  }

  static String? validateConfirmPassword(String? value, String? password) {
    if (value == null || value.isEmpty) {
      return "LocaleKeys.validators_confirm_password_required.tr()";
    }
    if (value != password) {
      return "LocaleKeys.validators_passwords_mismatch.tr()";
    }
    return null;
  }

  /// Validate phone number digits only.
  /// countryCode should be like "+20"
  /// minLength/maxLength indicate digits count AFTER country code.
  // validators.dart (تعديل validatePhone)
  /// Validate phone where expectedLength is number of digits AFTER removing leading 0.
  static String? validatePhone(
    String? rawValue, {
    required String countryCode,
    int expectedLength = 8,
  }) {
    if (rawValue == null || rawValue.isEmpty) {
      return "LocaleKeys.validators_phone_required.tr()";
    }

    final trimmed = rawValue.trim();

    // Must be digits only
    if (!RegExp(r'^[0-9]+$').hasMatch(trimmed)) {
      return "LocaleKeys.validators_phone_invalid.tr()";
    }

    // Normalize: if user typed leading zero remove it for length check
    final normalized = trimmed.startsWith('0') ? trimmed.substring(1) : trimmed;

    if (normalized.length < expectedLength) {
      return "LocaleKeys.validators_phone_short.tr()";
    }
    if (normalized.length > expectedLength) {
      return "LocaleKeys.validators_phone_long.tr()";
    }

    return null; // valid
  }

  static String? validateUrl(String? value) {
    if (value == null || value.isEmpty) return null; // Allow empty field
    final Uri? uri = Uri.tryParse(value);
    if (uri == null ||
        !uri.hasScheme ||
        !(uri.scheme == 'http' || uri.scheme == 'https')) {
      return "LocaleKeys.validators_url_invalid.tr()";
    }
    return null;
  }

  static String? validateYoutubeLink(String? value) {
    if (value == null || value.isEmpty) return null; // not required
    const pattern = r'^(https?\:\/\/)?(www\.youtube\.com|youtu\.be)\/.+$';
    final regex = RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return "LocaleKeys.validators_youtube_invalid.tr()";
    }
    return null;
  }

  static String? validateAmount(
    String? value, {
    double min = 0.01,
    double max = 10000,
  }) {
    if (value == null || value.isEmpty) {
      return " LocaleKeys.validators_amount_required.tr()";
    }
    final parsed = double.tryParse(value);
    if (parsed == null) {
      return "LocaleKeys.validators_amount_invalid.tr()";
    }
    if (parsed < min) {
      return "";
    }
    if (parsed > max) {
      return "LocaleKeys.validators_amount_too_large.tr(arg";
    }
    return null;
  }
}
