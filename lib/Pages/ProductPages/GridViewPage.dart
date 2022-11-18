import 'package:flutter/material.dart';
import 'package:phoenix/DbService/ProductDao.dart';
import 'package:phoenix/Entity/Product.dart';
import 'package:phoenix/Pages/ProductPages/UrunPage.dart';
import 'package:phoenix/Theme/MyCard.dart';

import '../../Entity/Person.dart';

class GridViewPage extends StatefulWidget {

  bool  isSearch;
  String name;
  Person _person;


  GridViewPage(this.isSearch,this.name,this._person);

  @override
  State<GridViewPage> createState() => _GridViewPageState();
}

class _GridViewPageState extends State<GridViewPage> {
  Future<List<Product>> getAllProduct() async {
    List<Product> products =await ProductDao().getAll();

    return products;
  }

  Future<List<Product>> getProduct(name) async {
    List<Product> products =await ProductDao().getProductWithName(name);

    return products;
  }

  @override
  Widget build(BuildContext context) {
    var page = MediaQuery.of(context).size;
    var pageWidth = page.width;
    return Scaffold(
        body:  FutureBuilder<dynamic>(
      future: widget.isSearch ? getProduct(widget.name):getAllProduct() ,
      builder: (context, snapchat) {
        if (snapchat.hasData) {
          var _products = snapchat.data;
          return GridView.builder(
              itemCount: _products.length,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
                  childAspectRatio: 2/3
                  ),
              itemBuilder: (context, item) {
                return GestureDetector(
                    child: MyCard(product: _products[item], pagewidth: pageWidth, person: widget._person),
                  onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>UrunPage(widget._person,_products[item])));},
                    );

              });
        } else {
          return Container();
        }
      },
    ));
  }
}
