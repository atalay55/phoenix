import 'package:phoenix/DbService/VeritabaniYardimci.dart';
import 'package:phoenix/Entity/Product.dart';

class ProductDao{

  Future<List<Product>> getAll() async{
    var db = await VeritabaniYardimci.veriTabaniErisim();
    List<Map<String,dynamic>> maps=await db.rawQuery("select * from product");
    return List.generate(maps.length, (index) {
      var satir=maps[index];
      return Product(id: satir["id"],productName: satir["productName"],imagePath: satir["imagePath"],price: satir["price"]);
    });
  }



}