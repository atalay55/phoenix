import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:phoenix/DbService/PersonDao.dart';
import 'package:phoenix/Entity/Person.dart';
import 'package:phoenix/Entity/Product.dart';
import 'package:phoenix/Theme/SnopZoom.dart';
import 'package:pinch_zoom/pinch_zoom.dart';

class UrunPage extends StatefulWidget {
  Product? product;
  Person? person;
  double? productRate = 0;

  UrunPage(this.person, this.product);

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
          backgroundColor: Colors.indigoAccent,
          title: const Text("Product Page"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  width: pageWidth / 2.5,
                  height: pageWidth / 2.5,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  SnopZoom(widget.product!.imagePath.toString())));
                    },
                    child: PinchZoom(

                      child: InteractiveViewer(
                        clipBehavior: Clip.none,
                        child: AspectRatio(
                            aspectRatio: 1,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: CachedNetworkImage(
                                imageUrl: widget.product!.imagePath.toString(),
                                width: pageWidth / 2,
                                height: pageWidth / 2,
                                fit: BoxFit.cover,
                                placeholder: (context, url) =>
                                    const CircularProgressIndicator(),
                                errorWidget: (context, url, error) => Container(
                                  color: Colors.black26,
                                  child: Icon(Icons.error_outline),
                                ),
                              ),
                            )),
                      ),
                      resetDuration: const Duration(milliseconds: 100),
                    ),
                  )), // Image.asset(widget.product.imagePath)),
              Padding(
                padding: EdgeInsets.only(top: pageWidth / 20),
                child: Text(
                  widget.product!.productName.toString(),
                  style: TextStyle(fontSize: 25, color: Colors.red),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: pageWidth / 26),
                child: Text(
                  widget.product!.price.toString() + "  TL ",
                  style: TextStyle(fontSize: 20),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(top: pageWidth / 12),
                child: ratingBar()),

              Padding(
                padding: EdgeInsets.only(top: pageWidth / 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: pageWidth / 1.5,
                      height: pageWidth / 10,
                      child: ElevatedButton(
                          onPressed: () {
                            setState(() {

                             PersonDao().addProductToProductList(widget.person!.id!.toInt(),widget.product!.id.toString());
                            });
                          },
                          child: Text(" Add cart ")),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  ratingBar() {
    return RatingBar.builder(
      initialRating: 3,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
      itemBuilder: (context, _) => Icon(
        Icons.star,
        color: Colors.amber,
      ),
      onRatingUpdate: (rating) {
        widget.productRate=rating;
        print(rating);
      },
    );
  }
}
