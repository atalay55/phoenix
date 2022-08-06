
cheackPass(var  pass){

  if(pass.isEmpty){
    return "Password field cannot be empty";
  }
  if(!(pass=="123")){
    return "Wrong Password";}
  return null;
}

cheackTc(var personelNum) {
  if (personelNum.isEmpty) {
    return "Personle Number field cannot be empty";
  }
  if (personelNum != "aa") {
    return "Tc kimlik numarasi bulunamadi";
  }
  return null;
}
