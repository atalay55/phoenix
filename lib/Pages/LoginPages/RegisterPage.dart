import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:phoenix/DbService/PersonDao.dart';
import 'package:phoenix/Entity/Person.dart';
import 'package:phoenix/Pages/HomePage.dart';
import 'package:phoenix/Pages/LoginPages/LoginPage.dart';

import 'package:phoenix/Validator/RegisterValidator.dart';

class RegisterPage extends StatefulWidget {



  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  var formKey = GlobalKey<FormState>();
  var personNumCont = TextEditingController();
  var nameCont = TextEditingController();
  var surnameCont = TextEditingController();
  var phoneNumCont = TextEditingController();
  var passCont = TextEditingController();
  bool isAgree =false;
  var dateCont = TextEditingController();


  @override
  void initState() {

    print(isAgree);
  }
  @override
  Widget build(BuildContext context) {
    var pageScreen = MediaQuery.of(context).size;
    var pageHeight = pageScreen.height;
    var pageWidth = pageScreen.width;
    return Scaffold(
        body: Center(
            child: SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
          SizedBox(
              width: pageWidth / 2.5,
              height: pageWidth / 2.5,
              child: Image.asset("Images/register.png")),
          Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding:EdgeInsets.only(
                          bottom: pageHeight / 40,
                          left: pageWidth / 15,
                          right: pageWidth / 13),
                      child: SizedBox(
                          width: pageWidth/2.6,
                          child:TextFormField(
                            controller: nameCont,
                            keyboardType: TextInputType.name,
                            textCapitalization: TextCapitalization.words,
                            textInputAction: TextInputAction.next,
                            decoration: borderStyle("İsim"),
                            validator: (value) {
                              return cheackName(value);
                            },
                          )),
                    ),
                    Padding(
                      padding:EdgeInsets.only(
                          bottom: pageHeight / 40,
                      ),
                      child: SizedBox(
                          width: pageWidth/2.6,
                          child:TextFormField(
                            controller: surnameCont,
                            keyboardType: TextInputType.name,
                            textCapitalization: TextCapitalization.words,
                            textInputAction: TextInputAction.next,
                            decoration: borderStyle("Soyisim"),
                            validator: (value) {
                              return cheackName(value);
                            },
                          ),),
                    ),

                  ],
                ),

                Padding(
                  padding: EdgeInsets.only(
                      bottom: pageHeight / 40,
                      left: pageWidth / 15,
                      right: pageWidth / 15),
                  child: TextFormField(
                    controller: personNumCont,
                    keyboardType: TextInputType.number,
                    textCapitalization: TextCapitalization.words,
                    textInputAction: TextInputAction.next,
                    decoration: borderStyle("T.C Kimlik No"),
                    validator: (value) {
                      return checkPersonelNum(value);
                    },
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(
                      bottom: pageHeight / 40,
                      left: pageWidth / 15,
                      right: pageWidth / 15),
                  child: TextFormField(
                    controller: dateCont,
                    keyboardType: TextInputType.datetime,
                    textCapitalization: TextCapitalization.words,
                    textInputAction: TextInputAction.next,

                    decoration: InputDecoration(
                      border:OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                         borderSide: BorderSide(color: Colors.grey, width: 1.5),
                      ),

                      suffixIcon: GestureDetector(child: Icon(Icons.date_range),
                       onTap: (){
                        showDatePicker(context: context, initialDate: DateTime.now() , firstDate: DateTime(2017), lastDate: DateTime(2080)).
                        then((value){ setState(() {
                          String date = "${value.day} : ${value.month} : ${value.year}";
                            dateCont.text=date;
                        }); }) ;

                       },
                      ),
                      label: Text("Date of birth",style: TextStyle(color: Colors.black54)),
                         ),
                    onTap: (){

                    },
                    validator: (value) {

                    },
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(
                      bottom: pageHeight / 40,
                      left: pageWidth / 15,
                      right: pageWidth / 15),
                  child: TextFormField(
                    keyboardType: TextInputType.phone,
                    textCapitalization: TextCapitalization.words,
                    textInputAction: TextInputAction.next,
                    controller: phoneNumCont,
                    decoration: borderStyle("Phone number"),
                    validator: (value) {
                      return cheackPass(value.toString());
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      bottom: pageHeight / 40,
                      left: pageWidth / 15,
                      right: pageWidth / 15),
                  child: TextFormField(
                    obscureText: true,
                    controller: passCont,
                    keyboardType: TextInputType.text,
                    textCapitalization: TextCapitalization.words,
                    textInputAction: TextInputAction.next,
                    decoration: borderStyle("Parola"),
                    validator: (value) {
                      return cheackPass(value.toString());
                    },
                  ),
                ),

                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: pageWidth / 15),
                      child: Checkbox(
                          value: isAgree,
                          onChanged: (value) {
                            setState(() {
                              print(value);
                              isAgree = value;
                            });
                          }),
                    ),
                    GestureDetector(
                      onTap: (){
                        gizlilikAlert(context,isAgree);

                      },
                      child: Text(
                        "Uye Gizlilik Politakası",
                        style: TextStyle(color: Colors.green),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: pageWidth / 25),
                      child: SizedBox(
                          height: 40,
                          width: 85,
                          child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LoginPage()),
                                        (route) => false,
                                  );
                                });
                              },
                              child: const Text("Cancel"))),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: SizedBox(
                        height: 40,
                        width: 85,
                        child: ElevatedButton(
                            onPressed: () {
                              var isCorrect = formKey.currentState.validate();
                              setState(() {
                                if (isCorrect) {
                                  var person = Person(
                                      name: nameCont.text,
                                      surName: surnameCont.text,
                                      personelNum: personNumCont.text,
                                      phoneNum:phoneNumCont.text ,
                                      password: passCont.text
                                  );
                                  checkPersonExits(person)
                                      .then((value) {
                                        if(isAgree){
                                           if(value){
                                          PersonDao().addPerson(person);
                                          snackbar(context, "Kayit Basarili");
                                          Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => HomePage(person)),
                                              (route) => false);
                                    }else{
                                      snackbar(context, "kullanici mevcut");
                                    }

                                  }else{
                                    snackbar(context, "please check üye gizlilik politikası");
                                  }}
                                  );
                                } else {
                                  print("not valid format");
                                }
                              });
                            },
                            child: const Text("Register")),
                      ),
                    ),
                  ],
                ),
              ],
            ),)
          ]))));
  }

}

borderStyle(name) {
  return InputDecoration(
    errorBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 2, color: Colors.red),
        borderRadius: BorderRadius.circular(20)),
    focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 2, color: Colors.red),
        borderRadius: BorderRadius.circular(20)),
    enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 2, color: Colors.black87),
        borderRadius: BorderRadius.circular(20)),
    focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 2, color: Colors.blueGrey),
        borderRadius: BorderRadius.circular(20)),
    label: Text(
      name,
      style: TextStyle(fontSize: 15.0),
    ),
    fillColor: Colors.white,
  );
}

snackbar(BuildContext context, message, {duration = 600}) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(message),
    duration: Duration(milliseconds: duration),
  ));
}

gizlilikAlert(context,isAgree) {
  showDialog(
      context: context,
      builder: (BuildContext contex) {
        return AlertDialog(
          title: Text("Gizlilik Sözlesmesi"),
          content: Text(" Quisque id sodales tellus. Curabitur bibendum enim a diam viverra vehicula. "
              "Fusce sagittis, arcu a consectetur faucibus, metus nisi faucibus lacus, a euismod tortor risus quis est."
              " Aenean vitae volutpat mauris. Duis nec elementum sem. Phasellus malesuada, justo ut hendrerit dictum, velit est ultrices est"
              ", nec dignissim augue nisi et justo. Phasellus placerat purus venenatis odio posuere, eget convallis ligula finibus."
              " Nulla at libero et quam sagittis aliquet dignissim nec nisi. Sed quis suscipit tellus, eu tincidunt orci."),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Simdi degil")),
            TextButton(
                onPressed: () {
                    Navigator.pop(context);
                },
                child: Text("Kabul et")),
          ],
        );
      });
}
