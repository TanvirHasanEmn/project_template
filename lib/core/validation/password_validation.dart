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