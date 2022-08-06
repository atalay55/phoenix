import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:phoenix/Pages/HomePage.dart';
import 'package:phoenix/Pages/RegisterPage.dart';
import 'package:phoenix/Validator/LoginValidator.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var personelNumCont = TextEditingController();
  var passCont = TextEditingController();
  var formKey = GlobalKey<FormState>();
  var rememberMe =false;


    @override
    Widget build(BuildContext context) {

      var page = MediaQuery.of(context).size;
      var pageHeight=page.height;
      var pageWidth=page.width;
      return Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    width: pageWidth/3,
                    height: pageHeight/4,

                    child: Image.asset("Images/anka.png")),
                Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding:  EdgeInsets.only(bottom: pageHeight/40,left: pageWidth/10 ,right: pageWidth/10) ,
                          child: TextFormField(
                            controller: personelNumCont,
                            decoration:  InputDecoration(
                              errorBorder:OutlineInputBorder(borderSide:BorderSide(width: 2,color:Colors.red),borderRadius: BorderRadius.circular(8.0)),
                              focusedErrorBorder: OutlineInputBorder(borderSide:BorderSide(width: 2,color:Colors.red),borderRadius: BorderRadius.circular(8.0)),
                              enabledBorder: OutlineInputBorder(borderSide:BorderSide(width: 2,color:Colors.black87),borderRadius: BorderRadius.circular(8.0)),
                              focusedBorder:OutlineInputBorder(borderSide:BorderSide(width: 2,color:Colors.blueGrey),borderRadius: BorderRadius.circular(8.0)) ,

                              label: Text("UserName",style: TextStyle(fontSize: 15.0),),

                              fillColor: Colors.white,
                            ),

                            validator: (value){
                              return cheackTc(value);
                            },
                          ),
                        ),
                        Padding(
                          padding:  EdgeInsets.only(bottom: pageHeight/30,left: pageWidth/10 ,right: pageWidth/10) ,
                          child: TextFormField(
                            obscureText: true,
                            controller: passCont,
                            decoration: InputDecoration(
                              errorBorder:OutlineInputBorder(borderSide:BorderSide(width: 2,color:Colors.red),borderRadius: BorderRadius.circular(8.0)),
                              focusedErrorBorder: OutlineInputBorder(borderSide:BorderSide(width: 2,color:Colors.red),borderRadius: BorderRadius.circular(8.0)),
                              enabledBorder: OutlineInputBorder(borderSide:BorderSide(width: 2,color:Colors.black87),borderRadius: BorderRadius.circular(8.0)),
                              focusedBorder:OutlineInputBorder(borderSide:BorderSide(width: 2,color:Colors.blueGrey),borderRadius: BorderRadius.circular(8.0)) ,
                              label: Text("Password",style: TextStyle(fontSize: 15.0),),
                              fillColor: Colors.white,
                            ),
                            validator: (value){
                              return cheackPass(value);
                            },
                          ),
                        ),
                        Padding(
                          padding:  EdgeInsets.only(left:pageWidth/10,bottom: pageWidth/30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("Beni hatırla"),
                              Switch(
                                value: rememberMe,onChanged: (value){
                                setState(() {
                                  rememberMe=value;
                                });},
                                activeColor: Colors.green,
                                activeTrackColor: Colors.greenAccent,
                                inactiveThumbColor: Colors.blueGrey,
                                inactiveTrackColor: Colors.black45,
                              ),],
                          ),
                        )
                        ,

                        Padding(
                          padding:  EdgeInsets.only(left:pageWidth/12, right: pageWidth/12,bottom: pageWidth/20),
                          child: SizedBox(
                            height: pageHeight/16,
                            width: pageWidth,
                            child:ElevatedButton(
                                style: TextButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),backgroundColor: Colors.green),
                                child:Text("login"),
                                onPressed: (){
                                  var isCorrect=formKey.currentState!.validate();
                                  setState(() {
                                    if(isCorrect){
                                      snackbar(context, "Giris Basarılı",duration: 1);
                                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>HomePage()), (route) => false);
                                    }
                                  });
                                }

                            ),
                          ),
                        ),

                      ],
                    )),




                Padding(
                  padding:  EdgeInsets.only(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding:  EdgeInsets.only(left:pageWidth/12,right: pageWidth/20,bottom: pageWidth/10),
                        child: SizedBox(
                          height: pageHeight/16,
                          width: pageWidth/2.6,
                          child: ElevatedButton(
                              style: TextButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),backgroundColor: Colors.white,side: BorderSide(width: 2,color: Colors.red)),
                              onPressed: (){
                                setState(() {
                                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>RegisterPage()), (route) => false);
                                });
                              }, child: Text("Uye ol",style: TextStyle(color: Colors.red),)),
                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.only(right: pageWidth/14,bottom: pageWidth/10),
                        child: SizedBox(
                          height: pageHeight/16,
                          width: pageWidth/2.8,
                          child: ElevatedButton(
                              style: TextButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),backgroundColor: Colors.red,side: BorderSide(width: 4,color: Colors.red)), onPressed: (){
                            setState(() {
                              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>HomePage()), (route) => false);
                            });
                          }, child: Text("e-Devlet ile Giris",style: TextStyle(color:Colors.white),)),
                        ),
                      ),

                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [GestureDetector(child: Text("Parolamı unuttum"),onTap: () {
                    print("parolamı değitire tıklandı");
                  },),],
                )
              ],

            ),
          ),
        ),
      );
    }
  }
  snackbar(BuildContext context,var message,{duration= 4}){
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: Duration(seconds: duration),
      content: Text(message),
    ));
  }
