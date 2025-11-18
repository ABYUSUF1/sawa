// Format phone number with country code for display
import 'package:phone_form_field/phone_form_field.dart';

String formatPhoneNumber(String e164PhoneNumber) {
  final phone = PhoneNumber.parse(e164PhoneNumber);

  // Force phone number to be LTR
  return "\u202A+${phone.countryCode} ${phone.formatNsn()}\u202C";
}
