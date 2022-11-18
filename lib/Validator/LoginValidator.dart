import 'dart:async';
import 'package:phoenix/DbService/PersonDao.dart';
import 'package:phoenix/Entity/Mesage.dart';
import 'package:phoenix/Entity/Person.dart';

class LoginValidator{
  Message msg=Message();
  List<Person> users=[];
  Person? person;


  Future<Message> findPerson(String userName,String pass)async {
    users = await PersonDao().getAll();
    msg.isCorrect = false;
    msg.message = "wrong user";
    for (Person p in users) {
      if (p.userName == userName && p.password == pass) {
        msg.isCorrect = true;
        msg.message = "valid user";
      }

    }  return msg;
  }
  checkUserName(String userName) {
    Message msg = Message();
    if (userName.isEmpty) {
      msg.message = "kullanıcı adı boş geçilemez";
      msg.isCorrect = false;
      return msg.message;
    }
    if (userName.length < 3) {
      msg.message = "kullanıcı adı 3 kelimeden fazla olmalıdır";
      msg.isCorrect = false;
      return msg.message;
    }
    if (userName.startsWith(RegExp(r"[0123456789]"))) {
      msg.message = "kullanıcı adı sayı ile başlayamaz";
      msg.isCorrect = false;
      return msg.message;
    }
    msg.isCorrect = true;
    return null;
  }

  checkPass(String pass) {
    Message msg = Message();
    if (pass.isEmpty) {
      msg.message = "sifre alani bos gecilemez";
      msg.isCorrect = false;
      return msg.message;
    }
    if(!pass.contains(RegExp(r"[0123456]"))){
      msg.message = "sifrenizde rakam bulanması gerekir";
      msg.isCorrect = false;
      return msg.message;
    }

    if(!pass.contains(RegExp(r"[a-zA-Z]"))){
      msg.message = "sifrenizde harf bulanması gerekir";
      msg.isCorrect = false;
      return msg.message;
    }
    msg.isCorrect = true;
    return null;
  }

}






