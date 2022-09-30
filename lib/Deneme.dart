import 'package:phoenix/DbService/PersonDao.dart';
import 'package:phoenix/Entity/Person.dart';



Future<List<Person>>isPersonNumExits()async {
  List<Person> users = await PersonDao().getAll();
  for (Person p in users) {
    print(p.name);
  }
  return users;
}