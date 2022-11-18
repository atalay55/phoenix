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
          isRemember: satir["isRemember"],
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
    personDb["isRemember"]=person.isRemember;
    db.insert("person", personDb);
  }


  Future<List<Person>> getUser(int userId) async {
    var db = await VeritabaniYardimci.veriTabaniErisim();
    List<Map<String, dynamic>> maps =
    await db.rawQuery("SELECT * FROM person where id=${userId}");
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
          isRemember: satir["isRemember"],
          userImage: satir["userImage"]);
    });
  }

  Future<void> deletePerson(int userId) async {
    var db = await VeritabaniYardimci.veriTabaniErisim();
    db.delete("person", where: "id=$userId");
  }

  Future<void> updatePersonPass(int userId, String password) async {
    var db = await VeritabaniYardimci.veriTabaniErisim();
    var personDb = Map<String, dynamic>();
    personDb["password"] = password;

    await db.update("person", personDb, where: "id=?", whereArgs: [userId]);
  }

  Future<void> updateImage(int userId, String userImage) async {
    var db = await VeritabaniYardimci.veriTabaniErisim();
    var personDb = Map<String, dynamic>();
    personDb["userImage"] = userImage;

    await db.update("person", personDb, where: "id=?", whereArgs: [userId]);
  }

  Future<void> updatePersonUserName(int userId, String userName) async {
    var db = await VeritabaniYardimci.veriTabaniErisim();
    var personDb = Map<String, dynamic>();
    personDb["userName"] = userName;

    await db.update("person", personDb, where: "id=?", whereArgs: [userId]);
  }

  Future<void> updatePersonPhone(int userId, String phone) async {
    var db = await VeritabaniYardimci.veriTabaniErisim();
    var personDb = Map<String, dynamic>();
    personDb["phoneNumber"] = phone;

    await db.update("person", personDb, where: "id=?", whereArgs: [userId]);
  }


  Future<void> updateProducts(int userId, String products) async {
    var db = await VeritabaniYardimci.veriTabaniErisim();
    var personDb = Map<String, dynamic>();
    personDb["cardProductId"] = products;

    await db.update("person", personDb, where: "id=?", whereArgs: [userId]);
  }


  Future<void> updateIsRemember(int userId, String isRemember) async {
    var db = await VeritabaniYardimci.veriTabaniErisim();
    var personDb = Map<String, dynamic>();
    personDb["isRemember"] = isRemember;

    await db.update("person", personDb, where: "id=?", whereArgs: [userId]);
  }


  Future<List<String?>>? getProducts(int userId) async {
    var db = await VeritabaniYardimci.veriTabaniErisim();
    List<Map<String, dynamic>> maps =
        await db.rawQuery("SELECT cardProductId FROM person where id=${userId}");
    return List.generate(maps.length, (index) {
      var satir = maps[index];
      return satir["cardProductId"];
    });
  }

  Future<void> addProductToProductList(int personid, String? productsId) async {

    List<String?>? str = await getProducts(personid);
    String? temStr;
    if (str?.first == null) {
      str!.clear();
      temStr = productsId;
    } else {
      temStr = str!.first.toString() + "," + productsId!;
    }
    var db = await VeritabaniYardimci.veriTabaniErisim();
    var personDb = Map<String, dynamic>();
    personDb["cardProductId"] = temStr;
    print(temStr);

    await db.update("person", personDb, where: "id=?", whereArgs: [personid]);
  }

  Future<void> deleteProductToProductList(int userId, String? productsId) async {

    var db = await VeritabaniYardimci.veriTabaniErisim();
    var personDb = Map<String, dynamic>();
    personDb["cardProductId"] = productsId;

    await db.update("person", personDb, where: "id=?", whereArgs: [userId]);
  }

  Future<void> deleteAllProductToProductList(int userId) async {
    var db = await VeritabaniYardimci.veriTabaniErisim();
    var personDb = Map<String, dynamic>();
    personDb["cardProductId"] = null;
    await db.update("person", personDb, where: "id=?", whereArgs: [userId]);
  }
}
