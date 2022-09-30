import 'package:flutter/material.dart';
import 'package:phoenix/Entity/Product.dart';
import 'package:phoenix/Pages/CartPage.dart';


class UrunPage extends StatefulWidget {

  Product product;
  UrunPage(this.product);
  UrunPage.empty();

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
          backgroundColor: Colors.pinkAccent,
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
                padding:  EdgeInsets.only(top: pageWidth/20),
                child: Text(widget.product.productName,style: TextStyle(fontSize: 25,color: Colors.red),),
              ),
              Padding(
                padding: EdgeInsets.only(top: pageWidth/26),
                child: Text(widget.product.price.toString() + "  TL ",style: TextStyle(fontSize: 20),),
              ),
              Padding(
                padding:  EdgeInsets.only(top:pageWidth/8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    SizedBox(
                      width:pageWidth/1.5  ,
                      height:pageWidth/10  ,
                      child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> CardPage(widget.product.id)));
                            });

                          },
                          child: Text("Sepete Ekle ")),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
