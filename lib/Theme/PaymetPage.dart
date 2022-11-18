import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

import 'package:http/http.dart' as http;
import 'package:phoenix/Models/IyzicoPayment.dart';

class PaymetPage extends StatefulWidget {


  @override
  State<PaymetPage> createState() => _PaymetPageState();
}

class _PaymetPageState extends State<PaymetPage> {
  String? cardNumber = '';
  String? expiryDate = '';
  String? cardHolderName = '';
  String? cvvCode = '';
  bool? isCvvFocused = false;
  bool? registerCard = false;
  final GlobalKey<FormState>? formKey = GlobalKey<FormState>();
  bool? _isLoading = false;

  void onCreditCardModelChange(CreditCardModel creditCardModel) {
    setState(() {
      cardNumber = creditCardModel.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }
  _pay() async {
    String token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2MDBlYWY2YjU3NTEwNzI3NDg5YjAxYWIiLCJpYXQiOjE2MTU0NDkxMzl9.YTRsYrZqMDmByiOK3XqE6IuEtOaBRmJwtV_qBXy0wVI';
    String paymentUrl = 'http://10.202.0.149:3000/api/payment/iyzico';
    final body = Map<String,dynamic>();
    var expireMonth = expiryDate!.split('/')[0];
    var expireYear = expiryDate!.split('/')[1];
    cardNumber = cardNumber!.split(" ").join("");
    print(expiryDate![0]);
    print(expiryDate![1]);
    body['cardNumber'] = cardNumber;
    body['expireMonth'] = expireMonth;
    body['expireYear'] = expireYear;
    body['cardHolderName'] = cardHolderName;
    body['cvc'] = cvvCode;
    body['registerCard'] = registerCard! ? '1' : '0';
    final response = await http.post(Uri.parse(paymentUrl),body: jsonEncode(body), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    if(response.statusCode == 200){

      final iyzicoPayment = iyzicoPaymentFromJson(response.body);
      print(iyzicoPayment.status);
      if(iyzicoPayment.status == 'success'){
        print("islem basarılı");
      }else{
        var err = jsonDecode(response.body);
        _showMyDialog('Unsuccessful Payment',err['errorMessage']);
      }
    }else{
      _showMyDialog('Unsuccessful Payment','Something went wrong');
    }

  }

  Future<void> _showMyDialog(String title, String content){
    return showDialog<void>(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: Text(title),
            content: Text(content),
          );
        }).then((value) => {
      setState(() {
        _isLoading = false;
      })
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: Text('Pay '),
          centerTitle: true,
          backgroundColor:Colors.indigoAccent,
        ),
        body: SafeArea(
          child: Column(
            children: <Widget>[
              CreditCardWidget(
                height: 155,
                cardNumber: cardNumber!,
                expiryDate: expiryDate!,
                cardHolderName: cardHolderName!,
                cvvCode: cvvCode!,
                showBackView: isCvvFocused!,
                obscureCardNumber: true,
                obscureCardCvv: true,
                onCreditCardWidgetChange: (CreditCardBrand ) {  },
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      CreditCardForm(
                        formKey: formKey!,
                        obscureCvv: true,
                        obscureNumber: true,
                        cardNumberDecoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Number',
                          hintText: 'XXXX XXXX XXXX XXXX',
                        ),
                        expiryDateDecoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Expired Date',
                          hintText: 'XX/XX',
                        ),
                        cvvCodeDecoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'CVV',
                          hintText: 'XXX',
                        ),
                        cardHolderDecoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Card Holder',
                        ),
                        onCreditCardModelChange: onCreditCardModelChange, cvvCode: '', expiryDate: '', cardNumber: '', cardHolderName: '', themeColor:Colors.red,
                      ),
                      ElevatedButton(
                          child: Container(
                            margin: const EdgeInsets.all(8),
                            child: const Text(
                              'Validate',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'halter',
                                fontSize: 14,
                                package: 'flutter_credit_card',
                              ),
                            ),
                          ),
                          onPressed: () {_pay();}
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        )
    );
  }
}
