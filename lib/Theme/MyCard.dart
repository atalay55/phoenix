import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:phoenix/DbService/PersonDao.dart';
import 'package:phoenix/Entity/Product.dart';
import 'package:phoenix/Theme/SnopZoom.dart';
import '../Entity/Person.dart';


class MyCard extends StatelessWidget {
  var pagewidth;
  Product? product;
  Person? person;

  MyCard({ this.product , this.pagewidth,this.person});


  @override
  Widget build(BuildContext context) {
    return myCard(product: product,pagewidth:pagewidth,context: context,person:person );
  }
}
myCard({Product? product,pagewidth,context,Person? person} ){
  return SizedBox(
    width: pagewidth/3,
    height: pagewidth/3,
    child: Card(
      color: Colors.blueGrey,
      child:Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [


          Container(
              height: pagewidth/3,
              child:Padding(
                padding: const EdgeInsets.only(top: 15,left: 10,right: 10),
                child:  GestureDetector(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: CachedNetworkImage(imageUrl:product!.imagePath.toString() ,width:pagewidth/2, fit: BoxFit.cover,
                        placeholder: (context, url) => const CircularProgressIndicator(),
                        errorWidget: (context,url,error)=>Container(color: Colors.black26,child: Icon(Icons.error_outline),),
                    ),
                  ),onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>SnopZoom(product.imagePath.toString())));
                },
                ),)
              )//Image.asset(product.imagePath)),
          , Padding(
            padding:  EdgeInsets.only(top: 20),
            child: Text(product.productName.toString(),style: TextStyle(color: Colors.white,fontSize: 25),),
          ),
           Padding(
            padding:  EdgeInsets.only(top: 10),
            child: Text(" ${product.productDetail!.length>120 ? product.productDetail!.substring(0,90):product.productDetail} ...",style: TextStyle(color: Colors.black87,fontSize: 16,)),
          ),

        ],
      ),
    ),
  );
}