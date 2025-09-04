class Validation{

  //*Validate Email

  String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email cannot be empty';
    }
    const emailPattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    final regex = RegExp(emailPattern);

    if (!regex.hasMatch(value.trim())) {
      return 'Enter a valid email address';
    }
    return  null;
  }



  //*Validate Name

  String? validateName(String? name) {
    if (name!.trim().isEmpty) {
      return "Name cannot be empty";
    }
    return null;
  }

  //*Validate null

  String? validateNull(String? value, String title) {
    if (value == null || value.trim().isEmpty) {
      return "$title cannot be empty";
    }
    return null;
  }

  //*Validate Password

  String? validatePassword(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Password cannot be empty';
    }


    if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }


    final upperCasePattern = RegExp(r'[A-Z]');
    if (!upperCasePattern.hasMatch(value)) {
      return 'Password must contain at least one uppercase letter';
    }


    final lowerCasePattern = RegExp(r'[a-z]');
    if (!lowerCasePattern.hasMatch(value)) {
      return 'Password must contain at least one lowercase letter';
    }

    final numberPattern = RegExp(r'\d');
    if (!numberPattern.hasMatch(value)) {
      return 'Password must contain at least one number';
    }

    final specialCharPattern = RegExp(r'[!@#\$&*~]');
    if (!specialCharPattern.hasMatch(value)) {
      return 'Password must contain at least one special character (e.g., !@#\$&*~)';
    }
    return null;
  }


  //*Validate Phone Number

  String? validatePhoneNumber(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Phone number cannot be empty';
    }

    // Phone number regex (accepts 10-15 digit numbers, with optional '+' at the beginning)
    const phonePattern = r'^\+?[0-9]{10,15}$';
    final regex = RegExp(phonePattern);

    if (!regex.hasMatch(value.trim())) {
      return 'Enter a valid phone number';
    }
    return null;
  }


   //*Validate Pin

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



}

