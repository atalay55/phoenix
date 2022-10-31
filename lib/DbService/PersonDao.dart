import 'package:phoenix/DbService/VeritabaniYardimci.dart';
import 'package:phoenix/Entity/Person.dart';

class PersonDao {
  Future<List<Person>> getAll() async {
    var db = await VeritabaniYardimci.veriTabaniErisim();
    List<Map<String, dynamic>> maps = await db.rawQuery("select * from person");
    return List.generate(maps.length, (index) {
      var satir = maps[index];
      return Person(
          id: satir["id"],
          name: satir["name"],
          surName: satir["surName"],
          userName: satir["userName"],
          phoneNum: satir["phoneNumber"],
          password: satir["password"],
          products: satir["cardProductId"],
          date: satir["date"],
          userImage: satir["userImage"]);
    });
  }

  Future<void> addPerson(Person person) async {
    var db = await VeritabaniYardimci.veriTabaniErisim();
    var personDb = Map<String, dynamic>();
    personDb["name"] = person.name;
    personDb["surName"] = person.surName;
    personDb["userName"] = person.userName;
    personDb["phoneNumber"] = person.phoneNum;
    personDb["password"] = person.password;
    personDb["cardProductId"] = person.products;
    personDb["date"] = person.date;
    personDb["userImage"] = person.userImage;
    db.insert("person", personDb);
  }

  Future<void> deletePerson(int id) async {
    var db = await VeritabaniYardimci.veriTabaniErisim();
    db.delete("person", where: "id=$id");
  }

  Future<void> updatePersonPass(int id, String password) async {
    var db = await VeritabaniYardimci.veriTabaniErisim();
    var personDb = Map<String, dynamic>();
    personDb["password"] = password;

    await db.update("person", personDb, where: "id=?", whereArgs: [id]);
  }

  Future<void> updatePersonUserName(int id, String userName) async {
    var db = await VeritabaniYardimci.veriTabaniErisim();
    var personDb = Map<String, dynamic>();
    personDb["userName"] = userName;

    await db.update("person", personDb, where: "id=?", whereArgs: [id]);
  }

  Future<void> updatePersonPhone(int id, String phone) async {
    var db = await VeritabaniYardimci.veriTabaniErisim();
    var personDb = Map<String, dynamic>();
    personDb["phoneNumber"] = phone;

    await db.update("person", personDb, where: "id=?", whereArgs: [id]);
  }

  Future<void> updateProducts(id, String products) async {
    var db = await VeritabaniYardimci.veriTabaniErisim();
    var personDb = Map<String, dynamic>();
    personDb["cardProductId"] = products;

    await db.update("person", personDb, where: "id=?", whereArgs: [id]);
  }


  Future<List<String>> getProducts(id) async {
    var db = await VeritabaniYardimci.veriTabaniErisim();
    List<Map<String, dynamic>> maps =
        await db.rawQuery("SELECT cardProductId FROM person where id=${id}");
    return List.generate(maps.length, (index) {
      var satir = maps[index];
      return satir["cardProductId"];
    });
  }

  Future<void> addProductToProductList(id, String productsId) async {
    var str = await getProducts(id);
    String temStr;
    if (str.first == null) {
      str.clear();
      temStr = productsId;
    } else {
      temStr = str.first.toString() + "," + productsId;
    }
    var db = await VeritabaniYardimci.veriTabaniErisim();
    var personDb = Map<String, dynamic>();
    personDb["cardProductId"] = temStr;

    await db.update("person", personDb, where: "id=?", whereArgs: [id]);
  }

  Future<void> deleteProductToProductList(userId, String productsId) async {

    var db = await VeritabaniYardimci.veriTabaniErisim();
    var personDb = Map<String, dynamic>();
    personDb["cardProductId"] = productsId;

    await db.update("person", personDb, where: "id=?", whereArgs: [userId]);
  }

  Future<void> deleteAllProductToProductList(userId) async {
    var db = await VeritabaniYardimci.veriTabaniErisim();
    var personDb = Map<String, dynamic>();
    personDb["cardProductId"] = null;
    await db.update("person", personDb, where: "id=?", whereArgs: [userId]);
  }
}
