String? validateName(String? name) {
  if (name!.trim().isEmpty) {
    return "Name cannot be empty";
  }
  return null;
}
