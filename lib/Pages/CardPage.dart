import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:phoenix/DbService/PersonDao.dart';
import 'package:phoenix/DbService/ProductDao.dart';
import 'package:phoenix/Entity/Product.dart';
import 'package:phoenix/Theme/PaymetPage.dart';


class CardPage extends StatefulWidget {
  String cardId;
  String personId;
  CardPage(this.personId);

  CardPage.empty();

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {



  List<Product>_productss=[];
  List<int> pro=[];
  var total;

  Future<void> convertproductList(personId) async {
       List<Product> _comingProducts;
      List<int> productListInt= await parseProductList(personId);
      _productss.clear();
      for(int i in productListInt){
        _comingProducts= await ProductDao().getProductWithId(i);
       _productss.add(_comingProducts.first);
      }
      total = _productss
          .map((item) => item.price)
          .reduce((value, current) => value + current);
      return _productss;

  }
  Future<void> deleteProduct(int productId){

    pro.remove(productId);
    String str=pro.map((e) => e.toString()).join(",");
    if(str.isEmpty){
      str =null;
    }
    PersonDao().deleteProductToProductList(int.parse(widget.personId),str);

  }

  Future<List<int>> parseProductList(id) async {
    String as;
    pro.clear();
    var pr = await PersonDao().getProducts(id);
    as= pr.first;
    var bs = as.split(",");
    for(var i in bs){
      if(i.contains("[")){
        i=i[1];
        pro.add(int.parse(i));
      }  pro.add(int.parse(i));
    }
    return pro;
  }

@override
  void initState() {
  }
    @override
    Widget build(BuildContext context) {
    var heigth = MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;

      return Scaffold(
         appBar: AppBar(title: Text("CardPage"),backgroundColor: Colors.indigoAccent),
          body: FutureBuilder<dynamic>(
            future: convertproductList(int.parse(widget.personId)),
            builder: (context, snapchat) {
              if (snapchat.hasData) {
               List<Product> _products = snapchat.data;

                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: width,
                        height: heigth/1.3,
                        child: ListView.builder(
                          shrinkWrap: true,
                            itemCount: _products.length,
                            itemBuilder: (BuildContext context, int item) {

                              return Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: ListTile(

                                  leading: SizedBox(width: width/6,
                                    child: CachedNetworkImage(imageUrl: _products[item]
                                        .imagePath ?? "Images/deneme1",),
                                  ),
                                  //Image.asset(_products[item].imagePath),
                                  title: Text(_products[item].productName),
                                  trailing: GestureDetector(onTap:(){
                                    setState(() {

                                      deleteProduct(_products[item].id);
                                    });

                                    },child: Icon(Icons.cancel)),
                                  subtitle: Text("${_products[item].price.toString()} "),

                                ),
                              );
                            }
                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.only(bottom: 15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding:  EdgeInsets.only(left: 12.0,top: 18.0),
                              child: SizedBox(width: width/1.5,height: heigth/15,child: ElevatedButton(onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=> PaymetPage()));

                              }, child: Text("Satın al"))),
                            ),
                            Padding(
                              padding:  EdgeInsets.only( left: 10.0),
                              child: Text("${total.toString()} TL",style: TextStyle(color: Colors.black,height: 3,fontSize: 16),),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                );
              } else {
                return Container();
              }
            },
          )
      );
    }
}