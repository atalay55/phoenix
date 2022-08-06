import 'package:flutter/material.dart';
import 'package:phoenix/Entity/Product.dart';
import 'package:phoenix/Pages/UrunPage.dart';
import 'package:phoenix/Theme/MyCard.dart';

class GridViewPage extends StatefulWidget {

  @override
  State<GridViewPage> createState() => _GridViewPageState();
}

class _GridViewPageState extends State<GridViewPage> {
  Future<List<Product>> getProduct() async {
    var product1 = Product(
        id: 1,
        productName: "pc",
        price: 25000,
        imagePath: "Images/register.png");
    var product2 = Product(
        id: 2,
        productName: "klaveye mause",
        price: 500,
        imagePath: "Images/register.png");
    var product3 = Product(
        id: 3,
        productName: "sandalye",
        price: 500,
        imagePath: "Images/register.png");
    var product4 = Product(
        id: 4,
        productName: "koltuk",
        price: 1200,
        imagePath: "Images/register.png");

    var products = [product1, product2, product3, product4];
    return products;
  }

  @override
  Widget build(BuildContext context) {
    var page = MediaQuery.of(context).size;
    var pageWidth = page.width;
    return Scaffold(
        body: FutureBuilder<List<Product>>(
      future: getProduct(),
      builder: (context, snapchat) {
        if (snapchat.hasData) {
          var _products = snapchat.data;
          return GridView.builder(
              itemCount: _products!.length,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
                  childAspectRatio: 2/3
                  ),
              itemBuilder: (context, item) {
                return GestureDetector(
                    child: MyCard(product: _products[item], pagewidth: pageWidth),
                    onTap: (){
                      setState(() {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>UrunPage(product: _products[item],)));
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
