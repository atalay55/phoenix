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
  List<int> pro;
  List<Product>_productss=[];
  Product _product;

  Future<void> addPrdocutToCard(id) async {
    products = await ProductDao().getProductWithId(int.parse(id));
    return products;
  }



  Future<List<Product>> convertproductList(personId) async {
      List<int> pr= await parseProductList(personId);
      for(int i in pr){
        products= await ProductDao().getProductWithId(i);
       _product=products.first;
       _productss.add(_product);
      }
      return _productss;

  }

  Future<List<int>> parseProductList(id) async {
    var pr = await PersonDao().getProducts(id);
    String as= pr.first;
    var bs = as.split(",");
    pro = bs.map(int.parse).toList();

    return pro;
  }

  @override
  void initState() {
    _productss.clear();
  }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
          body: FutureBuilder<dynamic>(
            future: convertproductList(int.parse(widget.personId)),
            builder: (context, snapchat) {
              if (snapchat.hasData) {
                List<Product> _products = snapchat.data;
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
                          trailing: Text(_products[item].price.toString()),
                          subtitle: Text(_products[item].pieces.toString()),

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