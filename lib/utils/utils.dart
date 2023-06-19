class Utils {
  bool isValidName(String name) {
    RegExp regExp = RegExp(r"^[a-zA-Z]{3,}");
    return regExp.hasMatch(name);
  }

  bool isValidPassword(String contact) {
    RegExp regExp = RegExp(r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)");
    return regExp.hasMatch(contact);
  }

  bool isValidMobile(String number) {
    RegExp regExp = RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)');
    return regExp.hasMatch(number);
  }

  bool isValidEmail(String email) {
    RegExp regExp = RegExp(
        r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    return regExp.hasMatch(email);
  }
}
