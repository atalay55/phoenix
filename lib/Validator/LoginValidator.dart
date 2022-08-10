import 'package:phoenix/Entity/Mesage.dart';

cheackPass(var  pass){
  Message msg=Message();
  if(pass.isEmpty){
    msg.message="Password field cannot be empty";
    msg.isCorrect=false;
      return msg.message;
  }
  if(!(pass=="123")){
    msg.message="Wrong Password";
    msg.isCorrect=false;
    return msg.message;
     }
  msg.isCorrect=true;
  return null;
}
 cheackTc(var personelNum) {
  Message msg=Message();
  if (personelNum.isEmpty) {
    msg.message="Personle Number field cannot be empty";
    msg.isCorrect=false;
    return msg.message;
  }
  if (personelNum != "aa") {
    msg.message="Tc kimlik numarasi bulunamadi";
    msg.isCorrect=false;
    return msg.message;
  }
    msg.isCorrect=true;
    return null;
}
