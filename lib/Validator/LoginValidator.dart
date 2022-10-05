import 'dart:async';
import 'package:phoenix/DbService/PersonDao.dart';
import 'package:phoenix/Entity/Mesage.dart';
import 'package:phoenix/Entity/Person.dart';

class loginValidator{
  Message msg=Message();

  Person person;
  Future<List<Person>>isPersonNumExits()async{
    List<Person> users = await PersonDao().getAll();
    return users;
  }

  Future<Message> findPerson(String personelNum,String pass)async{
    msg.isCorrect=true;

    List<Person> persons=[];
    await isPersonNumExits().then((value)async {
      for(Person p in value){
         persons.add(p);
      }
    });
    for(Person p in persons){
      if(p.personelNum!=personelNum){
        msg.message="Wrong User";
        msg.isCorrect= false;
        return msg;

      }
      else if(p.password!= pass){
        msg.message= " wrong password";
        msg.isCorrect= false;
        return msg;

      }
      return msg;
    }

  }


cheackTc(String personelNum){
    if (personelNum.isEmpty) {
     msg.message= "Personle Number field cannot be empty";
     msg.isCorrect= false;
     return msg.message;
    }
    if(personelNum.length<6){
      msg.message= "personel number long must be 6 ";
      msg.isCorrect= false;
      return msg.message;
    }
    return  null;
    }


cheackPass( pass){
    if(pass.isEmpty){
      msg.message=  "Password field cannot be empty";
      msg.isCorrect= false;
      return msg.message;

    }
    if(pass.toString().length<3){
      msg.message=  "Password length must longer than 3 ";
      msg.isCorrect= false;
      return msg.message;

    }
    return null;

  }

}






