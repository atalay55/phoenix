import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:phoenix/Pages/HomePage.dart';
import 'package:phoenix/Theme/MyCard.dart';
import 'package:phoenix/Validator/RegisterValidator.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool changeEmailAndPhone = false;
  String email="sada@sdasd.com";
  String phone="553 364 81 12";
  var mailCont=TextEditingController();
  var phoneCont=TextEditingController();

  @override
  Widget build(BuildContext context) {
    var pageScreen = MediaQuery.of(context).size;
    var pageHeight = pageScreen.height;
    var pageWidth = pageScreen.width;
    return ListView(children: [
      Container(
          color: Colors.blueGrey,
          child: SizedBox(
              height: pageWidth / 4.5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 15.0),
                        child: SizedBox(
                            height: pageWidth / 11,
                            width: pageWidth / 4,
                            child: Image.asset("Images/register.png")),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 13),
                        child: Text(
                          "fatih Atalay",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: EdgeInsets.only(top: 35),
                        child: IconButton(
                            onPressed: () {
                              setState(() {
                                changeEmailAndPhone
                                    ? changeEmailAndPhone = false
                                    : changeEmailAndPhone = true;
                              });
                            },
                            icon: Icon(Icons.build)),
                      )
                    ],
                  ),
                ],
              ))),
      TextFormField(
       enabled: changeEmailAndPhone,
       decoration:InputDecoration(icon: Icon(Icons.email),hintText:email),
        onChanged: (value){
         if(cheackEmail(value)){
           print(cheackEmail(value));
           email=value;
         }
        },
     ),
      TextField(
        enabled: changeEmailAndPhone,
        decoration:InputDecoration(icon: Icon(Icons.phone),hintText:phone
        ),
      ),
      ListTile(title: Text("canli destek"),leading: Icon(Icons.support_agent), trailing: Icon(Icons.arrow_right),
    onTap: (){Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>HomePage()), (route) => false);},),
      ListTile(title: Text("Adreslerim"),leading: Icon(Icons.location_city), trailing: Icon(Icons.arrow_right),
        onTap: (){Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>HomePage()), (route) => false);},),
      ListTile(title: Text("Favorilerim"),leading: Icon(Icons.favorite), trailing: Icon(Icons.arrow_right),
        onTap: (){Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>HomePage()), (route) => false);},),
      ListTile(title: Text("Geçmis Siparislerim"),leading: Icon(Icons.shopping_basket), trailing: Icon(Icons.arrow_right),
        onTap: (){Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>HomePage()), (route) => false);},),
      ListTile(title: Text("Giris Ayarlari"),leading: Icon(Icons.key), trailing: Icon(Icons.arrow_right),
        onTap: (){Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>HomePage()), (route) => false);},),
      ListTile(title: Text("Yardım"),leading: Icon(Icons.help), trailing: Icon(Icons.arrow_right),
        onTap: (){Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>HomePage()), (route) => false);},),
      ListTile(title: Text("Çıkıs Yap"),leading: Icon(Icons.exit_to_app), trailing: Icon(Icons.arrow_right),
        onTap: (){SystemNavigator.pop();},),



    ]);
  }
}
