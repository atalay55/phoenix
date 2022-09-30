import 'package:phoenix/DbService/PersonDao.dart';
import 'package:phoenix/Entity/Mesage.dart';
import 'package:phoenix/Entity/Person.dart';
Future<bool> checkPersonExits(Person person) async {
    List<Person> persons = await PersonDao().getAll();
    for (Person p in persons) {
      if (p.personelNum == person.personelNum) {
          return false;
      }
    }
    return true;
  }
cheackPass(String pass) {
  Message msg=Message();
  if (pass.isEmpty) {
    msg.message="Password field cannot be empty";
    msg.isCorrect=false;
    return msg.message;
  }
  msg.isCorrect=true;
  return null;
}
cheackName(var name) {
  Message msg=Message();
  if (name.isEmpty) {
    msg.message="name field cannot be empty";
    msg.isCorrect=false;
    return msg.message;
  }
  if (name.length < 3) {
    msg.message="name does not lower than 3";
    msg.isCorrect=false;
    return msg.message;
  }
  msg.isCorrect=true;
  return null;
}
cheackEmail(var email) {
  Message msg=Message();
  if (email.isEmpty) {
    msg.message="Email field cannot be empty";
    msg.isCorrect=false;
    return msg.message;
  }
  if (!email.contains("@")) {
    msg.message="enter data in valid format";
    msg.isCorrect=false;
    return msg.message;
  }
  msg.isCorrect=true;
  return null;
}
checkPersonelNum(var perNum) {
  Message msg=Message();
  if (perNum.isEmpty) {
    msg.message="Email field cannot be empty";
    msg.isCorrect=false;
    return msg.message;
  }
  msg.isCorrect=true;
  return null;
}