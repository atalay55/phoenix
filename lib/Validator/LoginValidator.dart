import 'dart:async';


import 'package:phoenix/DbService/PersonDao.dart';
import 'package:phoenix/Entity/Mesage.dart';
import 'package:phoenix/Entity/Person.dart';

class loginValidator{
  var currentpersonelNum;
  var pass;
  Person person;
  Future<List<Person>>isPersonNumExits()async{
    List<Person> users = await PersonDao().getAll();
    return users;
  }

  cheackTc(personelNum){
    Message msg=Message();
    msg.isCorrect=false;

    if (personelNum.isEmpty) {
      msg.message="Personle Number field cannot be empty";
      return msg.message;
    }

      isPersonNumExits().then((value)async{
        await Future.forEach(value, (element) {
          person= element;
          if(person.personelNum == personelNum.toString()){
           currentpersonelNum= person.personelNum;
           print(currentpersonelNum);
            return currentpersonelNum;
          }


        });
     /*
       for (Person p in value) {
         if(p.personelNum==personelNum){
            print(p.personelNum==personelNum);
            currentpersonelNum=  p.personelNum;
            print(currentpersonelNum);
        }
          }*/
        }
      );
    if(currentpersonelNum==null){
      print(currentpersonelNum);
      return "Wrong user";
    }else{
      return null;
    }




  }
  cheackPass( pass){
    Message msg=Message();

    if(pass.isEmpty){
      msg.message="Password field cannot be empty";
      msg.isCorrect=false;
      return msg.message;
    }
    isPersonNumExits().then((value) {
      for (Person p in value) {
        if(p.personelNum!=pass){
          msg.message= null;
        }if(p.personelNum==pass){
          msg.message="true";
        }
      }
    }
    );

    if(msg.message==null){
      msg.message="Wrong password ";
      msg.isCorrect=false;
      return msg.message;
    }if(msg.message=="true"){
      return null;
    }


  }
  }








