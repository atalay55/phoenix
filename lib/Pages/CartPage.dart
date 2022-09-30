import 'package:flutter/material.dart';
import 'package:phoenix/DbService/ProductDao.dart';
import 'package:phoenix/Entity/Product.dart';


class CardPage extends StatefulWidget {
  int cardId;
  CardPage(this.cardId);

  CardPage.empty();

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {


  List<Product> products;
  Future<void> addPrdocutToCard(id) async{

    products = await ProductDao().getProductWithId(id);
    return products;
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:  FutureBuilder<dynamic>(
          future:  addPrdocutToCard(widget.cardId) ,
          builder: (context, snapchat) {
            if (snapchat.hasData) {
              List<Product> _products = snapchat.data;
              return ListView.builder(
                  itemCount: _products.length,
                  itemBuilder: (BuildContext context,int item){
                    return Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: ListTile(
                        leading: Image.asset(_products[item].imagePath),
                        title: Text(_products[item].productName),
                        trailing: Text((item+1).toString()),

                      ),
                    );
                  }
                  );
            } else {
              return Container();
            }
          },
        ));
  }
}
