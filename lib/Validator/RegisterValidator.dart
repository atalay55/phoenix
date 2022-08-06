
cheackPass(String pass) {
  if (pass.isEmpty) {
    return "Password field cannot be empty";
  }
  return null;
}

cheackName(var name) {
  if (name!.isEmpty) {
    return "name field cannot be empty";
  }
  if (name.length < 3) {
    return "name does not lower than 3";
  }
  return null;
}

cheackEmail(var email) {
  if (email!.isEmpty) {
    return "Email field cannot be empty";
  }
  if (!email.contains("@")) {
    return "enter data in valid format";
  }
  return null;
}

checkPersonelNum(var perNum) {
  if (perNum!.isEmpty) {
    return "Email field cannot be empty";
  }

  return null;
}