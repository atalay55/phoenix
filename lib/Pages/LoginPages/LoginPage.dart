import 'package:flutter/material.dart';
import 'package:phoenix/DbService/PersonDao.dart';
import 'package:phoenix/Entity/Person.dart';
import 'package:phoenix/Pages/HomePage.dart';
import 'package:phoenix/Pages/LoginPages/ForgetPassPage.dart';
import 'package:phoenix/Pages/LoginPages/RegisterPage.dart';
import 'package:phoenix/Validator/LoginValidator.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Person _person;



  Future<Person> getPerson()async{
    List<Person> users = await PersonDao().getAll();

    for(Person p in users){
      if(p.personelNum==_personelNumCont.text&& p.password==_passCont.text){
        _person=p;
        return _person;

      }return null;
    }
  }





  var _rememberMe = false;
  var _personelNumCont = TextEditingController();
  var _passCont = TextEditingController();
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
              SizedBox(
                  width: pageWidth / 3,
                  height: pageHeight / 4,
                  child: Image.asset("Images/anka.png")),
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
                          controller: _personelNumCont,
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
                              "PersonelNum",
                              style: TextStyle(fontSize: 15.0),
                            ),
                            fillColor: Colors.white,
                          ),
                          validator: (value) {
                            return cheackTc(context,value);
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            bottom: pageHeight / 30,
                            left: pageWidth / 10,
                            right: pageWidth / 10),
                        child: TextFormField(
                          obscureText: true,
                          controller: _passCont,
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
                              "Password",
                              style: TextStyle(fontSize: 15.0),
                            ),
                            fillColor: Colors.white,
                          ),
                          validator: (value) {
                            return cheackPass(context,value);
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: pageWidth / 10, bottom: pageWidth / 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("Beni hatırla"),
                            Switch(
                              value: _rememberMe,
                              onChanged: (value) {
                                setState(() {
                                  _rememberMe = value;
                                });
                              },
                              activeColor: Colors.green,
                              activeTrackColor: Colors.greenAccent,
                              inactiveThumbColor: Colors.blueGrey,
                              inactiveTrackColor: Colors.black45,
                            ),
                          ],
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
                                child: Text("login"),
                                onPressed: () {
                                  var isCorrect =
                                      _formKey.currentState.validate();
                                  setState(() {
                                    if (isCorrect) {

                                   getPerson().then((value) {
                                     Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>HomePage(value)), (route) => false);

                                   });
                                    }
                                  });
                                }),
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
                            onPressed: () {
                              setState(() {
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => RegisterPage()),
                                    (route) => false);
                              });
                            },
                            child: Text(
                              "Uye ol",
                              style: TextStyle(color: Colors.red),
                            )),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          right: pageWidth / 14, bottom: pageWidth / 10),
                      child: SizedBox(
                        height: pageHeight / 16,
                        width: pageWidth / 2.8,
                        child: ElevatedButton(
                            style: TextButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                backgroundColor: Colors.red,
                                side: BorderSide(width: 4, color: Colors.red)),
                            onPressed: () {
                              setState(() {
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            HomePage(Person(personelNum: "000000",name: "fatih",password: "123564",phoneNum: "54961320215",surName: "atalay"))),
                                    (route) => false);
                              });
                            },
                            child: Text(
                              "e-Devlet ile Giris",
                              style: TextStyle(color: Colors.white),
                            )),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    child: Text("Parolamı unuttum"),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgetPassPage()));

                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

snackbar(BuildContext context, var message, {duration = 4}) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    duration: Duration(seconds: duration),
    content: Text(message),
  ));
}
