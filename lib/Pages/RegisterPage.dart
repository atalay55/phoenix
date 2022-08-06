import 'package:flutter/material.dart';
import 'package:phoenix/Entity/Person.dart';
import 'package:phoenix/Pages/HomePage.dart';
import 'package:phoenix/Pages/LoginPage.dart';
import 'package:phoenix/Validator/RegisterValidator.dart';



class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  var formKey = GlobalKey<FormState>();
  var personNumCont = TextEditingController();
  var nameCont = TextEditingController();
  var surnameCont = TextEditingController();
  var passCont = TextEditingController();
  var dateCont= TextEditingController();
  bool? isAgree =false;

  @override
  Widget build(BuildContext context) {
    var pageScreen = MediaQuery
        .of(context)
        .size;
    var pageHeight = pageScreen.height;
    var pageWidth = pageScreen.width;
    return Scaffold(

        body: Center(
            child: SingleChildScrollView(
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
                            Padding(
                              padding: EdgeInsets.only(bottom: pageHeight/40,left: pageWidth/15 ,right: pageWidth/15) ,
                              child: TextFormField(
                                controller: personNumCont,
                                decoration: borderStyle("T.C Kimlik No"),
                                validator: (value) {
                                  return checkPersonelNum(value!);
                                },
                              ),
                            ),

                            Padding(
                              padding: EdgeInsets.only(bottom: pageHeight/40,left: pageWidth/15 ,right: pageWidth/15) ,
                              child: TextFormField(
                                controller: nameCont,
                                decoration:  borderStyle("İsim"),
                                validator: (value) {
                                  return cheackName(value!);
                                },
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: pageHeight/40,left: pageWidth/15 ,right: pageWidth/15) ,
                              child: TextFormField(
                                controller: surnameCont,
                                decoration: borderStyle("Soyisim"),
                                validator: (value) {
                                  return cheackName(value!);
                                },
                              ),
                            ),
                            Padding(
                              padding:EdgeInsets.only(bottom: pageHeight/40,left: pageWidth/15 ,right: pageWidth/15) ,
                              child: TextFormField(
                                obscureText: true,
                                controller: passCont,
                                decoration:borderStyle("Parola"),
                                validator: (value) {

                                  return cheackPass(value.toString());
                                },
                              ),
                            ),

                          Padding(
                            padding: EdgeInsets.only(bottom: pageHeight/40,left: pageWidth/15 ,right: pageWidth/15) ,
                            child: TextFormField(
                              controller: dateCont,
                              decoration: borderStyle("Doğum tarihi"),
                              onTap: (){
                                showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(1900), lastDate: DateTime(2150)).then((takingTime) {

                                  setState(() {
                                    dateCont.text="${takingTime!.day} / ${takingTime.month} / ${takingTime.year}";
                                  });
                                  });

                              },
                            ),
                          ),
                            Row(
                              children: [
                                Padding(
                                  padding:  EdgeInsets.only(left: pageWidth/15),
                                  child: Checkbox( value: isAgree,onChanged: (value) {
                                    setState(() {
                                      isAgree = value;
                                    });
                                  }
                                  ),
                                ),
                                Text("Uye Gizlilik Politakası",style: TextStyle(color: Colors.green),),


                              ],
                            ),


                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(right: pageWidth /
                                      25),
                                  child: SizedBox(height: 40,
                                      width: 85,
                                      child: ElevatedButton(onPressed: () {
                                        setState(() {
                                          Navigator.pushAndRemoveUntil(context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    LoginPage()), (
                                                route) => false,);
                                        });
                                      }, child: const Text("Cancel"))),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: SizedBox(
                                    height: 40,
                                    width: 85,
                                    child:
                                    ElevatedButton(onPressed: () {
                                      var isCorrect = formKey.currentState!
                                          .validate();
                                      setState(() {

                                        if (isCorrect) {
                                          var person =Person(name: nameCont.text, surName: surnameCont.text, personelNum: personNumCont.text, password: passCont.text);
                                          snackbar(context, "Kayit basarili");
                                          Navigator.pushAndRemoveUntil(context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      HomePage()), (
                                                  route) => false);
                                        }

                                        else {
                                          snackbar(context, "failed");
                                        }
                                      });
                                    }, child: const Text("Register")),),
                                ),




                              ],
                            ),

                          ],
                        ),

                      )
                    ]
                )
            )
        )
    );
  }
}



borderStyle(name) {
  return

    InputDecoration(
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
    label: Text(name, style: TextStyle(fontSize: 15.0),),
    fillColor: Colors.white,
  );
}

snackbar(BuildContext context, message, {duration = 600}) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(message),
    duration: Duration(milliseconds: duration),
  ));
}
