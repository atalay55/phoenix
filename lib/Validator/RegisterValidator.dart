import 'package:phoenix/DbService/PersonDao.dart';
import 'package:phoenix/Entity/Mesage.dart';
import 'package:phoenix/Entity/Person.dart';

class RegisterValidator {


  Future<bool> checkPersonExits(Person person) async {
    List<Person> persons = await PersonDao().getAll();
    for (Person p in persons) {
      if (p.userName == person.userName) {
        return false;
      }
    }
    return true;
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

  checkName(String name) {
    Message msg = Message();
    if (name.isEmpty) {
      msg.message = "isim alanı boş geçilemez";
      msg.isCorrect = false;
      return msg.message;
    }
    if (name.length < 3) {
      msg.message = "isminiz 3 kelimeden küçük olamaz";
      msg.isCorrect = false;
      return msg.message;
    }
    if (name.contains(RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%0-9-]'))) {
      msg.message = "Geçersiz isim";
      msg.isCorrect = false;
      return msg.message;
    }

    msg.isCorrect = true;
    return null;
  }

  checksurName(String surName) {
    Message msg = Message();
    if (surName.isEmpty) {
      msg.message = "Soyisim alanı boş geçilemez";
      msg.isCorrect = false;
      return msg.message;
    }
    if (surName.length < 2) {
      msg.message = "2 kelimeden küçük olamaz";
      msg.isCorrect = false;
      return msg.message;
    }
    if (surName.contains(RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%0-9-]'))) {
      msg.message = "Geçersiz soyismin ";
      msg.isCorrect = false;
      return msg.message;
    }


    msg.isCorrect = true;
    return null;
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

  checkPhoneNumber(String phone){
    Message msg = Message();
    if (phone.isEmpty) {
      msg.message = "Telefon alanı boş geçilemez";
      msg.isCorrect = false;
      return msg.message;
    }
    if(phone.contains(RegExp(r"[a-zA-Z]"))){
      msg.message = "telefonunuzda harf bulanamaz";
      msg.isCorrect = false;
      return msg.message;
    }
    if(phone.length>11){
      msg.message = "telefonunuz 11 karakteri geçemez";
      msg.isCorrect = false;
      return msg.message;
    }
    msg.isCorrect = true;
    return null;
  }

  checkDate(String date){
    Message msg = Message();
    if (date.isEmpty) {
      msg.message = "Tarih kısmı boş gecilemez";
      msg.isCorrect = false;
      return msg.message;
    }


    if(date.contains(RegExp(r"[a-zA-Z]"))){
      msg.message = "Tarih kısmında harf bulunamaz";
      msg.isCorrect = false;
      return msg.message;
    }



    msg.isCorrect = true;
    return null;


  }



}