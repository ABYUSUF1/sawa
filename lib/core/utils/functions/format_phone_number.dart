// Format phone number with country code for display
import 'package:phone_form_field/phone_form_field.dart';

String formatPhoneNumber(String e164PhoneNumber) {
  print('Formatting phone number: $e164PhoneNumber');
  final phone = PhoneNumber.parse(e164PhoneNumber);
  return "+${phone.countryCode} ${phone.formatNsn()}";
}
