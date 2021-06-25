class Validator{
  static String? isFirstName(String firstname){
    return (firstname == null || firstname.isEmpty)
        ? "First name is required" : null;
  }

  static String ? isLastname (String lastname){
    return (lastname == null || lastname.isEmpty)
        ? "Last name is required" : null;
  }

  static String ? isPhoneNumber (String phone){
    if (phone == null || phone.isEmpty){
      return "Phone number is required";
    }
    try{
      int.parse(phone);
    }
    catch (err){
      return "Invalid phone number";
    }
  }
}