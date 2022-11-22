import 'package:flutter/material.dart';
import 'package:phoenix/DbService/PersonDao.dart';
import 'package:phoenix/Entity/Mesage.dart';
import 'package:phoenix/Entity/Person.dart';
import 'package:phoenix/Pages/HomePage.dart';
import 'package:phoenix/Pages/LoginPages/ForgetPassPage.dart';
import 'package:phoenix/Pages/LoginPages/RegisterPage.dart';
import 'package:phoenix/Validator/LoginValidator.dart';
import 'package:shared_preferences/shared_preferences.dart';




bool rememberMe = false ;

class LoginPage extends StatefulWidget {

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Person? _person;

  Future<Person?> getPerson( userName,pass)async{
    List<Person> users = await PersonDao().getAll();
    for(Person p in users){
      if(p.userName==userName&& p.password==pass){

        _person=p;
        return _person;
      }
    }

  }


  setUserName(String userName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('userName', userName);
  }
  Future<String> getUserName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? stringValue = prefs.getString('userName');
    return stringValue!;
  }

  @override
  void initState() {
   if(rememberMe){
    getUserName().then((value) =>  _userNameCont.text=value);
   }

  }

  var _userNameCont = TextEditingController();
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
                          controller: _userNameCont,

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
                            fillColor: Colors.white,
                            labelText: "user name"
                          ),
                          validator: (value) {

                           return LoginValidator().checkUserName(value!);

                          }
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

                            return LoginValidator().checkPass(value!);
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
                            Text("Remember me"),
                            Switch(
                              value: rememberMe,
                              onChanged: (value) {
                                setState(() {
                                  rememberMe = value;


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
                                  bool isTrue=_formKey.currentState!.validate();
                                  setState(() {



                                     login(_userNameCont.text, _passCont.text, isTrue);


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
                              "Sign up",
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
                                            HomePage(Person(userName: "000000",name: "fatih",password: "123456",phoneNum: "54961320215",surName: "atalay",userImage: "Images/indir.png"))),
                                    (route) => false);
                              });
                            },
                            child: Text(
                              "e-Devlet",
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
                    child: Text("forgot password "),
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

login(String userName,String pass,bool isTrue)async{
    Message msg= await LoginValidator().findPerson(userName,pass);

     if(msg.isCorrect){
       await  getPerson(_userNameCont.text.toString(),_passCont.text.toString()).then((value) {
         PersonDao().updateIsRemember(value!.id!.toInt(),rememberMe.toString());
         setUserName(_userNameCont.text);
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>HomePage(value)), (route) => false);
        });
      }
    if(isTrue){
        return ;
      }else{

        if(userName.isNotEmpty || pass.isNotEmpty)
          snackbar(context, msg.message);

      }

  }
}



snackbar(BuildContext context, var message, {duration = 3}) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    duration: Duration(seconds: duration),
    content: Text(message),
  ));
}

