String e164PhoneFormat(String phone) {
  final countryCode = phone.substring(0, phone.length - 10); // +20
  final nationalNumber = phone.substring(phone.length - 10); // 1234567890
  final part1 = nationalNumber.substring(0, 2); // 12
  final part2 = nationalNumber.substring(2, 6); // 3456
  final part3 = nationalNumber.substring(6); // 7890
  return '+$countryCode $part1 $part2 $part3';
}
