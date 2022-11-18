import 'package:flutter/material.dart';
import 'package:phoenix/DbService/PersonDao.dart';
import 'package:phoenix/Entity/Person.dart';
import 'package:phoenix/Pages/LoginPages/LoginPage.dart';
import 'package:phoenix/Validator/RegisterValidator.dart';

class ForgetPassPage extends StatefulWidget {

  @override
  State<ForgetPassPage> createState() => _ForgetPassPageState();
}

class _ForgetPassPageState extends State<ForgetPassPage> {

  Person? _person;
  Future<Person?> getPerson()async{
    List<Person> users = await PersonDao().getAll();

    for(Person p in users){
      if(p.userName==_userNameCont.text){
        _person=p;
        return _person;

      }return null;
    }
  }

  var _formKey = GlobalKey<FormState>();
  var _userNameCont = TextEditingController();
  var _passCont = TextEditingController();


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
                  key:_formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            bottom: pageHeight / 40,
                            left: pageWidth / 10,
                            right: pageWidth / 10),
                        child: TextFormField(
                          controller:_userNameCont,
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
                              "User Name",
                              style: TextStyle(fontSize: 15.0),
                            ),
                            fillColor: Colors.white,
                          ),
                          validator: (value) {
                            return RegisterValidator().checkPass(value!);
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
                              "Yeni Parola",
                              style: TextStyle(fontSize: 15.0),
                            ),
                            fillColor: Colors.white,
                          ),
                          validator: (value) {
                            return RegisterValidator().checkPass(value!);
                          },
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
                                child: Text("Değistir"),
                                onPressed: () {
                                  var isCorrect =
                                  _formKey.currentState!.validate();
                                  setState(() {

                                    if (isCorrect) {
                                      getPerson().then((value) {
                                        if(value==null){
                                          print("kullanici bulunamadi");
                                        }else{
                                          PersonDao().updatePersonPass(value.id!, _passCont.text);
                                          print("basariyla gerçeklestirldi");
                                          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>LoginPage()), (route) => false);

                                        }

                                      });

                                    }
                                  });
                                }),
                          ))
                    ],
                  )),

            ],
          ),
        ),
      ),
    );
  }
}
