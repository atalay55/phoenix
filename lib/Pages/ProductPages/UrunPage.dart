import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:phoenix/Entity/Product.dart';
import 'package:phoenix/Pages/CardPage.dart';
import 'package:phoenix/Theme/SnopZoom.dart';
import 'package:pinch_zoom/pinch_zoom.dart';


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
                  height: pageWidth/2.5,
                  child: PinchZoom(
                    image:InteractiveViewer(clipBehavior: Clip.none,child:
                    AspectRatio(aspectRatio: 1,child: ClipRRect(borderRadius: BorderRadius.circular(20),
                      child:  CachedNetworkImage(imageUrl:widget.product.imagePath ,width:pageWidth/2,height: pageWidth/2, fit: BoxFit.cover,
                        placeholder: (context, url) => const CircularProgressIndicator(),
                        errorWidget: (context,url,error)=>Container(color: Colors.black26,child: Icon(Icons.error_outline),),),)),)


                    ,resetDuration: const Duration(milliseconds: 100),
                  )), // Image.asset(widget.product.imagePath)),
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
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>SnopZoom(widget.product.imagePath),));
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
