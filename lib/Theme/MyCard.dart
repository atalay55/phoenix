import 'package:flutter/material.dart';
import 'package:phoenix/Entity/Product.dart';

class MyCard extends StatelessWidget {
  var pagewidth;
  Product product;

  MyCard({ this.product , this.pagewidth});

  @override
  Widget build(BuildContext context) {

    return myCard(product: product,pagewidth:pagewidth );
  }
}
myCard({Product product,pagewidth} ){
  return SizedBox(
    width: pagewidth/3,
    height: pagewidth/3,
    child: Card(
      color: Colors.blueGrey,
      child:Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Container( height: pagewidth/2.1,child: Image.asset(product.imagePath)),
          Padding(
            padding:  EdgeInsets.only(top: 10),
            child: Text(product.productName,style: TextStyle(color: Colors.white,fontSize: 25),),
          ),
          Padding(
            padding:  EdgeInsets.only(top: 10),
            child: Text(" ${product.price.toString()} TL ",style: TextStyle(color: Colors.white70,fontSize: 16)),
          ),
        ],
      ),
    ),
  );
}