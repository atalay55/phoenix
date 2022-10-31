import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:phoenix/DbService/PersonDao.dart';
import 'package:phoenix/DbService/ProductDao.dart';
import 'package:phoenix/Entity/Product.dart';


class CardPage extends StatefulWidget {
  String cardId;
  String personId;
  CardPage(this.personId);


  CardPage.empty();

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {

  List<Product> products;
  List<int> pro=[];
  List<Product>_productss=[];
  Product _product;

  Future<void> convertproductList(personId) async {
      List<int> pr= await parseProductList(personId);
      _productss.clear();

      for(int i in pr){
        products= await ProductDao().getProductWithId(i);
       _product=products.first;
       _productss.add(_product);
        print(products.first.id);

      }
      return _productss;

  }
  Future<void> deleteProduct(int productId){
    pro.remove(productId);
    String str=pro.map((e) => e.toString()).join(",");
    if(str.isEmpty){
      str =null;
    }
    PersonDao().deleteProductToProductList(widget.personId,str);

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
    print(pro);
    return pro;
  }



    @override
    Widget build(BuildContext context) {
      return Scaffold(
          body: FutureBuilder<dynamic>(
            future: convertproductList(int.parse(widget.personId)),
            builder: (context, snapchat) {
              if (snapchat.hasData) {
               var _products = snapchat.data;
                return ListView.builder(
                    itemCount: _products.length,
                    itemBuilder: (BuildContext context, int item) {
                      return Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: ListTile(
                          leading: SizedBox(width: 60,
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
                );
              } else {
                return Container();
              }
            },
          ));
    }
}