import 'package:phoenix/DbService/VeritabaniYardimci.dart';
import 'package:phoenix/Entity/Product.dart';
class ProductDao{
  Future<List<Product>> getAll() async{
    var db = await VeritabaniYardimci.veriTabaniErisim();
    List<Map<String,dynamic>> maps=await db.rawQuery("select * from product");
    return List.generate(maps.length, (index) {
      var satir=maps[index];
      return Product(id: satir["id"],productName: satir["productName"],
          pieces: satir["piece"],imagePath: satir["productImage"],price: satir["price"]
      ,productDetail: satir["productDetail"]);
    });
  }

  Future<List<Product>> getProductWithName(name) async{
    var db = await VeritabaniYardimci.veriTabaniErisim();
    List<Map<String,dynamic>> maps=await db.rawQuery("SELECT * FROM product WHERE productName like '%${name}%'");
    return List.generate(maps.length, (index) {
      var satir=maps[index];
      return Product(id: satir["id"],productName: satir["productName"],pieces:
      satir["piece"],imagePath: satir["productImage"],price: satir["price"],productDetail: satir["productDetail"]);
    });
  }
  Future<List<Product>> getProductWithId( id) async{
    var db = await VeritabaniYardimci.veriTabaniErisim();
    List<Map<String,dynamic>> maps=await db.rawQuery("SELECT * FROM product WHERE id=${id}");
      return List.generate(maps.length, (index) {
        var satir=maps[index];
        return Product(id: satir["id"],productName: satir["productName"],pieces: satir["piece"],
            imagePath: satir["productImage"],price: satir["price"],productDetail: satir["productDetail"]);
      });

  }
  Future<void> updateProductImage(id, String products) async {
    var db = await VeritabaniYardimci.veriTabaniErisim();
    var personDb = Map<String, dynamic>();
    personDb["productImage"] = products;

    await db.update("product", personDb, where: "id=?", whereArgs: [id]);
  }


  Future<void> addProduct(Product product) async{
    var db =await VeritabaniYardimci.veriTabaniErisim();
    var productDb=Map<String,dynamic>();
    productDb["productName"]=product.productName;
    productDb["price"]=product.price;
    productDb["piece"]=product.pieces;
    productDb["productImage"]=product.imagePath;
    productDb["productDetail"]=product.productDetail;
    db.insert("product", productDb);
  }
  Future<void> deleteProduct(int id) async{

    var db =await VeritabaniYardimci.veriTabaniErisim();
    db.delete("product",where: "id=$id");
  }

}