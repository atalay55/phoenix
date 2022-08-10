import 'package:phoenix/DbService/PersonDao.dart';
import 'package:phoenix/Entity/Mesage.dart';
import 'package:phoenix/Entity/Person.dart';



Future<bool> isPersonNumExits( context,personelNum)async{
  List<Person> users = await PersonDao().getAll();
   for(Person p in users){
     print(p.personelNum==personelNum.text.toString());
    if(p.personelNum==personelNum.text.toString()){
      return Future.value(true);
    }else{
    return  Future.value(false);
    }
  }
}
Future<bool> isPersonPassExits(context,pass)async{
  List<Person> users = await PersonDao().getAll();
  for(Person p in users){
    print(p.password ==pass.text.toString());
    if(p.password ==pass.text.toString()){
      return Future.value(true);
    }else{
      return Future.value(false);
    }
  }
}




cheackPass( context,pass){


  Message msg=Message();
  if(pass.isEmpty){
    msg.message="Password field cannot be empty";
    msg.isCorrect=false;
      return msg.message;
  }

  msg.isCorrect=true;
  return null;
}
 cheackTc(context, personelNum) {
  Message msg=Message();
  if (personelNum.isEmpty) {
    msg.message="Personle Number field cannot be empty";
    msg.isCorrect=false;
    return msg.message;
  }


    msg.isCorrect=true;
    return null;
}
