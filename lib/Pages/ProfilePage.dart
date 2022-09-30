import 'package:flutter/material.dart';
import 'package:phoenix/Entity/Person.dart';
import 'package:phoenix/Pages/HomePage.dart';
import 'package:phoenix/Pages/LoginPages/LoginPage.dart';
import 'package:phoenix/Validator/RegisterValidator.dart';

class ProfilePage extends StatefulWidget {
  Person _person;


  ProfilePage(this._person);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool changeEmailAndPhone = false;
  Person loginPersson;
  @override
  void initState() {
    loginPersson =widget._person;
    super.initState();
  }

  var personelNum=TextEditingController();
  var phone=TextEditingController();

  @override
  Widget build(BuildContext context) {

    String personelNum=widget._person.personelNum;
    var pageScreen = MediaQuery.of(context).size;
    var pageWidth = pageScreen.width;
    return ListView(children: [
      Container(
          color: Colors.black45,
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
                            height: pageWidth / 10,
                            width: pageWidth / 4,
                            child: Image.asset("Images/deneme1.png")),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 13),
                        child: Text(loginPersson.name,
                          style:const TextStyle(color: Colors.white, fontSize: 18),
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
                            icon:const Icon(Icons.build)),
                      )
                    ],
                  ),
                ],
              ))),
      TextFormField(
       enabled: changeEmailAndPhone,
       decoration:InputDecoration(icon:const Icon(Icons.email),hintText:loginPersson.personelNum),
        onChanged: (value){
         if(cheackEmail(value)){
           personelNum=value;
         }
        },
     ),
      TextField(
        enabled: changeEmailAndPhone,
        decoration:InputDecoration(icon: const Icon(Icons.phone),hintText:loginPersson.phoneNum
        ),
      ),
      ListTile(title:const Text("canli destek"),leading:const Icon(Icons.support_agent), trailing:const Icon(Icons.arrow_right),
    onTap: (){Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>HomePage(widget._person)), (route) => false);},),
      ListTile(title:const Text("Adreslerim"),leading:const Icon(Icons.location_city), trailing:const Icon(Icons.arrow_right),
        onTap: (){Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>HomePage(widget._person)), (route) => false);},),
      ListTile(title:const Text("Favorilerim"),leading:const Icon(Icons.favorite), trailing:const Icon(Icons.arrow_right),
        onTap: (){Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>HomePage(widget._person)), (route) => false);},),
      ListTile(title:const Text("Geçmis Siparislerim"),leading:const Icon(Icons.shopping_basket), trailing:const Icon(Icons.arrow_right),
        onTap: (){Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>HomePage(widget._person)), (route) => false);},),
      ListTile(title:const Text("Giris Ayarlari"),leading:const Icon(Icons.key), trailing:const Icon(Icons.arrow_right),
        onTap: (){Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>HomePage(widget._person)), (route) => false);},),
      ListTile(title:const Text("Yardım"),leading:const Icon(Icons.help), trailing:const  Icon(Icons.arrow_right),
        onTap: (){Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>HomePage(widget._person)), (route) => false);},),
      ListTile(title:const Text("Çıkıs Yap"),leading: const Icon(Icons.exit_to_app), trailing: const Icon(Icons.arrow_right),
        onTap: (){Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>LoginPage()), (route) => false);},),



    ]);
  }
}
