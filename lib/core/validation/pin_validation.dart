String? validatePin(String? value) {
  if (value == null || value.isEmpty) {
    return 'PIN cannot be empty';
  }
  if (value.length != 4) {
    return 'PIN must be exactly 4 digits';
  }
  if (!RegExp(r'^\d{4}$').hasMatch(value)) {
    return 'PIN must contain only numbers';
  }
  return null;
}
