import 'package:phoenix/Entity/Mesage.dart';
productValidator(var value){
  Message msg=Message();
  if (value.isEmpty) {
    msg.message=" field cannot be empty";
    msg.isCorrect=false;
    return msg.message;
  }
  msg.isCorrect=true;
  return null;
}