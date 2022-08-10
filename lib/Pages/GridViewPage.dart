import 'package:flutter/material.dart';
import 'package:phoenix/DbService/ProductDao.dart';
import 'package:phoenix/Entity/Product.dart';
import 'package:phoenix/Pages/UrunPage.dart';
import 'package:phoenix/Theme/MyCard.dart';

class GridViewPage extends StatefulWidget {

  @override
  State<GridViewPage> createState() => _GridViewPageState();
}

class _GridViewPageState extends State<GridViewPage> {
  Future<void> getProduct() async {
    List<Product> products =await ProductDao().getAll();

    return products;
  }


  @override
  Widget build(BuildContext context) {
    var page = MediaQuery.of(context).size;
    var pageWidth = page.width;
    return Scaffold(
        body: FutureBuilder<dynamic>(
      future: getProduct(),
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
                    child: MyCard(product: _products[item], pagewidth: pageWidth),
                    onTap: (){
                      setState(() {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>UrunPage( _products[item])));
                      });
                    }
                    );

              });
        } else {
          return Container();
        }
      },
    ));
  }
}
