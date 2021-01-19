class ValidationMixin {
  String validateEmail(String value) {
    if (!value.contains('@')) {
      return 'Please enter a valide email';
    }
    return null;
  }

  String codeCompanyControls(String value) {
    if (value.length < 4) {
      return 'The entered code is too short';
    }
    return null;
  }

  String validationPassword(String value) {
    if (value.length < 4) {
      return 'Password must be at least 4 characters';
    }
    return null;
  }
}
