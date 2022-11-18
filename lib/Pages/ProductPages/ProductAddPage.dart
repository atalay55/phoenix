import 'package:flutter/material.dart';
import 'package:phoenix/DbService/ProductDao.dart';
import 'package:phoenix/Entity/Product.dart';
import 'package:phoenix/Pages/HomePage.dart';
import 'package:phoenix/Validator/ProductValidator,.dart';

class ProductAddPage extends StatefulWidget {

  @override
  State<ProductAddPage> createState() => _ProductAddPageState();
}

class _ProductAddPageState extends State<ProductAddPage> {
  var _productNameCont= TextEditingController();
  var _priceCont= TextEditingController();
  var _pieceCont= TextEditingController();
  var _imagePath= TextEditingController();
  var _productDesc= TextEditingController();
  var _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var page = MediaQuery.of(context).size;
    var pageHeight = page.height;
    var pageWidth = page.width;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            bottom: pageHeight / 40,
                            left: pageWidth / 10,
                            right: pageWidth / 10),
                        child: TextFormField(
                          controller: _productNameCont,
                          decoration: InputDecoration(
                            errorBorder: OutlineInputBorder(
                                borderSide:
                                BorderSide(width: 2, color: Colors.red),
                                borderRadius: BorderRadius.circular(8.0)),
                            focusedErrorBorder: OutlineInputBorder(
                                borderSide:
                                BorderSide(width: 2, color: Colors.red),
                                borderRadius: BorderRadius.circular(8.0)),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                BorderSide(width: 2, color: Colors.black87),
                                borderRadius: BorderRadius.circular(8.0)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 2, color: Colors.blueGrey),
                                borderRadius: BorderRadius.circular(8.0)),
                            label: Text(
                              "Product Name",
                              style: TextStyle(fontSize: 15.0),
                            ),
                            fillColor: Colors.white,
                          ),
                          validator:(value){ return ProductValidator().checkProductName(value!);},


                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            bottom: pageHeight / 40,
                            left: pageWidth / 10,
                            right: pageWidth / 10),
                        child: TextFormField(
                          controller: _priceCont,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            errorBorder: OutlineInputBorder(
                                borderSide:
                                BorderSide(width: 2, color: Colors.red),
                                borderRadius: BorderRadius.circular(8.0)),
                            focusedErrorBorder: OutlineInputBorder(
                                borderSide:
                                BorderSide(width: 2, color: Colors.red),
                                borderRadius: BorderRadius.circular(8.0)),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                BorderSide(width: 2, color: Colors.black87),
                                borderRadius: BorderRadius.circular(8.0)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 2, color: Colors.blueGrey),
                                borderRadius: BorderRadius.circular(8.0)),
                            label: Text(
                              "Price",
                              style: TextStyle(fontSize: 15.0),
                            ),
                            fillColor: Colors.white,
                          ),
                          validator:(value){ return ProductValidator().checkPrductPrice(value!);},
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            bottom: pageHeight / 40,
                            left: pageWidth / 10,
                            right: pageWidth / 10),
                        child: TextFormField(
                          controller: _pieceCont,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            errorBorder: OutlineInputBorder(
                                borderSide:
                                BorderSide(width: 2, color: Colors.red),
                                borderRadius: BorderRadius.circular(8.0)),
                            focusedErrorBorder: OutlineInputBorder(
                                borderSide:
                                BorderSide(width: 2, color: Colors.red),
                                borderRadius: BorderRadius.circular(8.0)),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                BorderSide(width: 2, color: Colors.black87),
                                borderRadius: BorderRadius.circular(8.0)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 2, color: Colors.blueGrey),
                                borderRadius: BorderRadius.circular(8.0)),
                            label: Text(
                              "Pieces",
                              style: TextStyle(fontSize: 15.0),
                            ),
                            fillColor: Colors.white,
                          ),
                          validator:(value){ return ProductValidator().checkPrductPiece(value!);},
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            bottom: pageHeight / 40,
                            left: pageWidth / 10,
                            right: pageWidth / 10),
                        child: TextFormField(
                          controller: _imagePath,
                          decoration: InputDecoration(
                            errorBorder: OutlineInputBorder(
                                borderSide:
                                BorderSide(width: 2, color: Colors.red),
                                borderRadius: BorderRadius.circular(8.0)),
                            focusedErrorBorder: OutlineInputBorder(
                                borderSide:
                                BorderSide(width: 2, color: Colors.red),
                                borderRadius: BorderRadius.circular(8.0)),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                BorderSide(width: 2, color: Colors.black87),
                                borderRadius: BorderRadius.circular(8.0)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 2, color: Colors.blueGrey),
                                borderRadius: BorderRadius.circular(8.0)),
                            label: Text(
                              "Image Path",
                              style: TextStyle(fontSize: 15.0),
                            ),
                            fillColor: Colors.white,
                          ),validator:(value){ return ProductValidator().checkPrductDesc(value!);},
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            bottom: pageHeight / 40,
                            left: pageWidth / 10,
                            right: pageWidth / 10),
                        child: TextFormField(
                          controller: _productDesc,
                          decoration: InputDecoration(
                            errorBorder: OutlineInputBorder(
                                borderSide:
                                BorderSide(width: 2, color: Colors.red),
                                borderRadius: BorderRadius.circular(8.0)),
                            focusedErrorBorder: OutlineInputBorder(
                                borderSide:
                                BorderSide(width: 2, color: Colors.red),
                                borderRadius: BorderRadius.circular(8.0)),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                BorderSide(width: 2, color: Colors.black87),
                                borderRadius: BorderRadius.circular(8.0)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 2, color: Colors.blueGrey),
                                borderRadius: BorderRadius.circular(8.0)),
                            label: Text(
                              "Product description",
                              style: TextStyle(fontSize: 15.0),
                            ),
                            fillColor: Colors.white,
                          ),
                          validator:(value){ return ProductValidator().checkProductName(value!);},


                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.only(
                              left: pageWidth / 12,
                              right: pageWidth / 12,
                              bottom: pageWidth / 20),
                          child: SizedBox(
                            height: pageHeight / 16,
                            width: pageWidth,
                            child: ElevatedButton(
                                style: TextButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    backgroundColor: Colors.green),
                                child: Text("Add"),
                              onPressed: (){
                                 var isCorrect = _formKey.currentState!.validate();
                                  var product=Product(productName: _productNameCont.text,
                                      price: double.parse(_priceCont.text),pieces:int.parse(_pieceCont.text),
                                      imagePath: _imagePath.text,productDetail: _productDesc.text);
                                  setState(() {
                                    ProductDao().addProduct(product);
                                    _productNameCont.text="";
                                    _priceCont.text="";
                                    _pieceCont.text="";
                                    _imagePath.text="";
                                    _productDesc.text="";

                                    print("kaydedildi");

                                  });

                              },
                              ),
                          ))
                    ],
                  )),
              Padding(
                padding: EdgeInsets.only(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: pageWidth / 12,
                          right: pageWidth / 20,
                          bottom: pageWidth / 10),
                      child: SizedBox(
                        height: pageHeight / 16,
                        width: pageWidth / 2.6,
                        child: ElevatedButton(
                            style: TextButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                backgroundColor: Colors.white,
                                side: BorderSide(width: 2, color: Colors.red)),

                            child: Text(
                              "Cancel",
                              style: TextStyle(color: Colors.red),
                            ),
                          onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage.empty()));
                          },
                        ),
                      ),
                    ),

                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
