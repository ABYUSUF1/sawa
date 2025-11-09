bool isValidEgyptPhone(String phone) {
  final regex = RegExp(r'^(010|011|012|015)\d{8}$'); // Egyptian example
  return regex.hasMatch(phone);
}
