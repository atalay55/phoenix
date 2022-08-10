import 'package:flutter/material.dart';
import 'package:phoenix/Entity/Person.dart';
import 'package:phoenix/Entity/Product.dart';
import 'package:phoenix/Pages/GridViewPage.dart';
import 'package:phoenix/Pages/HomePage.dart';

class UrunPage extends StatefulWidget {


  Product product;
  UrunPage(this.product);





  @override
  State<UrunPage> createState() => _UrunPageState();
}

class _UrunPageState extends State<UrunPage> {
  @override
  Widget build(BuildContext context) {
    var page = MediaQuery.of(context).size;
    var pageWidth = page.width;
    return Scaffold(
        appBar: AppBar(
          title: const Text("Urün Page"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  width: pageWidth / 2.5,
                  child: Image.asset(widget.product.imagePath)),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(widget.product.productName,style: TextStyle(fontSize: 25,color: Colors.red),),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(widget.product.price.toString() + "  TL ",style: TextStyle(fontSize: 20),),
              ),
              Padding(
                padding:  EdgeInsets.only(top:pageWidth/6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding:  EdgeInsets.only(right: 25),
                      child: SizedBox(
                        width: pageWidth/4.5,
                        height:pageWidth/10  ,
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>HomePage.empty()), (route) => false);
                            },
                            child: Text("Cancel")),
                      ),
                    ),
                    SizedBox(
                      width:pageWidth/4.5  ,
                      height:pageWidth/10  ,
                      child: ElevatedButton(
                          onPressed: () {
                            print("satın alındı");
                          },
                          child: Text("Buy")),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
