String? validateNull(String? value, String title) {
  if (value == null || value.trim().isEmpty) {
    return "$title cannot be empty";
  }
  return null;
}
