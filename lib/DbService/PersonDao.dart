import 'package:phoenix/DbService/VeritabaniYardimci.dart';
import 'package:phoenix/Entity/Person.dart';

class PersonDao{
  Future<List<Person>> getAll() async{
    var db =await VeritabaniYardimci.veriTabaniErisim();
    List<Map<String,dynamic>> maps=await db.rawQuery("select * from person");
  return List.generate(maps.length, (index) {
    var satir=maps[index];
    return Person(id: satir["id"],name: satir["name"], surName:satir["surName"], personelNum: satir["personelNum"], phoneNum: satir["phoneNum"],password:satir["password"]);
  });

  }
  Future<void> addPerson(Person person) async{
    var db =await VeritabaniYardimci.veriTabaniErisim();
    var personDb= Map<String,dynamic>();
    personDb["name"]= person.name;
    personDb["surName"]= person.surName;
    personDb["personelNum"]= person.personelNum;
    personDb["personelNum"]=person.phoneNum;
    personDb["password"]= person.password;
    db.insert("person", personDb);
    
    
}
Future<void> deletePerson(int id) async{

  var db =await VeritabaniYardimci.veriTabaniErisim();
  db.delete("person",where: "id=$id");
}

  Future<void> updatePerson(int id , String password) async{

    var db =await VeritabaniYardimci.veriTabaniErisim();
    var personDb= Map<String,dynamic>();
    personDb["password"]= password;

    await db.update("person", personDb,where: "id=?",whereArgs:[id]);

  }

}
