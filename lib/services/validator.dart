class Validator{
  static String? isFirstName(String firstname){
    return (firstname == null || firstname.isEmpty)
        ? "First name is required" : null;
  }

  static String ? isLastname (String lastname){
    return (lastname == null || lastname.isEmpty)
        ? "Last name is required" : null;
  }
  ///phone number can be written with area code
  static final phoneRegEx = RegExp(r'^[0-9\+]+$');

  static String ? isPhoneNumber (String phone){
    if (phone == null || phone.isEmpty){
      return "Phone number is required";
    }
    if (phoneRegEx.hasMatch(phone) == false){
      return "Invalid phone number";
    }
  }
}