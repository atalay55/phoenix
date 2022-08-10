import 'package:phoenix/DbService/VeritabaniYardimci.dart';
import 'package:phoenix/Entity/Product.dart';

class ProductDao{

  Future<List<Product>> getAll() async{
    var db = await VeritabaniYardimci.veriTabaniErisim();
    List<Map<String,dynamic>> maps=await db.rawQuery("select * from product");
    return List.generate(maps.length, (index) {
      var satir=maps[index];
      return Product(id: satir["id"],productName: satir["productName"],pieces: satir["pieces"],imagePath: satir["imagePath"],price: satir["price"]);
    });
  }

  Future<void> addProduct(Product product) async{
    var db =await VeritabaniYardimci.veriTabaniErisim();
    var productDb=Map<String,dynamic>();
    productDb["productName"]=product.productName;
    productDb["price"]=product.price;
    productDb["pieces"]=product.pieces;
    productDb["imagePath"]=product.imagePath;
    db.insert("product", productDb);
  }

  Future<void> deleteProduct(int id) async{

    var db =await VeritabaniYardimci.veriTabaniErisim();
    db.delete("product",where: "id=$id");
  }



}