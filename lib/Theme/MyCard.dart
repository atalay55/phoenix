import 'package:flutter/material.dart';
import 'package:phoenix/Entity/Product.dart';

class MyCard extends StatelessWidget {
  var pagewidth;
  late Product? product;

  MyCard({required this.product ,required this.pagewidth});

  @override
  Widget build(BuildContext context) {

    return myCard(product: product,pagewidth:pagewidth );
  }
}
myCard({Product? product,pagewidth} ){
  return SizedBox(
    width: pagewidth/3,
    height: pagewidth/3,
    child: Card(
      color: Colors.white38,
      child:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
              height: pagewidth/8,
              width: pagewidth/8 ,
              child: Image.asset(product!.imagePath)),
          Padding(
            padding:  EdgeInsets.only(top: 10),
            child: Text(product.productName),
          ),
          Padding(
            padding:  EdgeInsets.only(top: 10),
            child: Text(" ${product.price.toString()}: TL "),
          ),
        ],
      ),
    ),
  );
}