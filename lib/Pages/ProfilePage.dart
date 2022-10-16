import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:phoenix/DbService/PersonDao.dart';
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
  File _image;

  @override
  void initState() {
    loginPersson = widget._person;
  }

  Future getImageWithGallery() async {
    var image = await ImagePicker().getImage(source: ImageSource.gallery);
    if (image == null) return;

    setState(() {
      _image = File(image.path);
    });
  }

  Future getImageWithCamera() async {
    var image = await ImagePicker().getImage(source: ImageSource.camera);
    if (image == null) return;

    setState(() {
      _image = File(image.path);
    });
  }

  var userName = TextEditingController();
  var phone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String userName = widget._person.userName;
    String phone=widget._person.phoneNum;
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
                        padding: EdgeInsets.only(top: 15.0, left: 15),
                        child: SizedBox(
                            height: pageWidth / 8,
                            width: pageWidth / 8,
                            child: GestureDetector(
                                onTap: () {
                                    buttomSheet(context, pageWidth, getImageWithGallery, getImageWithCamera);
                                },
                                onLongPress: () {},
                                child: CircleAvatar(
                                  backgroundImage:
                                      AssetImage(widget._person.userImage?? Icon(Icons.error_outline)),
                                ))),
                      ),
                      Column(children: [
                        Padding(
                          padding: EdgeInsets.only(top: 13, left: 13),
                          child: Text(
                            loginPersson.name + " " + loginPersson.surName,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 18),
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.only(top: 15),
                            child: Text(loginPersson.date ?? "18.05.2022")),
                      ]),
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
                            icon: const Icon(Icons.build)),
                      )
                    ],
                  ),
                ],
              ))),
      TextFormField(
        enabled: changeEmailAndPhone,
        decoration: InputDecoration(
            icon: const Icon(Icons.person), hintText: loginPersson.userName??"sdad"),
        onChanged: (value) {
          if (RegisterValidator().checkUserName(value)) {
            userName = value;
            PersonDao().updatePersonUserName(widget._person.id, value);
          }
        },
      ),
      TextField(
        enabled: changeEmailAndPhone,
        decoration: InputDecoration(
            icon: const Icon(Icons.phone), hintText: loginPersson.phoneNum),
        onChanged: (value) {
            print("çalıstı");
            phone=value;
            PersonDao().updatePersonPhone(widget._person.id, value);
        },
      ),
      ListTile(
        title: const Text("canli destek"),
        leading: const Icon(Icons.support_agent),
        trailing: const Icon(Icons.arrow_right),
        onTap: () {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => HomePage(widget._person)),
              (route) => false);
        },
      ),
      ListTile(
        title: const Text("Adreslerim"),
        leading: const Icon(Icons.location_city),
        trailing: const Icon(Icons.arrow_right),
        onTap: () {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => HomePage(widget._person)),
              (route) => false);
        },
      ),
      ListTile(
        title: const Text("Favorilerim"),
        leading: const Icon(Icons.favorite),
        trailing: const Icon(Icons.arrow_right),
        onTap: () {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => HomePage(widget._person)),
              (route) => false);
        },
      ),
      ListTile(
        title: const Text("Geçmis Siparislerim"),
        leading: const Icon(Icons.shopping_basket),
        trailing: const Icon(Icons.arrow_right),
        onTap: () {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => HomePage(widget._person)),
              (route) => false);
        },
      ),
      ListTile(
        title: const Text("Giris Ayarlari"),
        leading: const Icon(Icons.key),
        trailing: const Icon(Icons.arrow_right),
        onTap: () {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => HomePage(widget._person)),
              (route) => false);
        },
      ),
      ListTile(
        title: const Text("Yardım"),
        leading: const Icon(Icons.help),
        trailing: const Icon(Icons.arrow_right),
        onTap: () {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => HomePage(widget._person)),
              (route) => false);
        },
      ),
      ListTile(
        title: const Text("Çıkıs Yap"),
        leading: const Icon(Icons.exit_to_app),
        trailing: const Icon(Icons.arrow_right),
        onTap: () {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => LoginPage()),
              (route) => false);
        },
      ),
    ]);
  }
}

buttomSheet(context,pageWidth,getImageWithGallery,getImageWithCamera){
  return  showBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: pageWidth / 3,
          color: Colors.white12,
          child: Center(
              child: Column(
                mainAxisAlignment:
                MainAxisAlignment.start,
                crossAxisAlignment:
                CrossAxisAlignment.center,
                children: [
                  Row(
                      mainAxisAlignment:
                      MainAxisAlignment.start,
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: 15),
                          child: IconButton(
                              onPressed: () {
                                getImageWithGallery();
                              },
                              icon: Icon(
                                Icons
                                    .browse_gallery_sharp,
                                size: pageWidth / 8,
                              )),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 25),
                          child: IconButton(
                              onPressed: () {
                                getImageWithCamera();
                              },
                              icon: Icon(
                                Icons
                                    .add_a_photo_outlined,
                                size: pageWidth / 8,
                              )),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 25),
                          child: IconButton(
                              onPressed: () {
                                print(
                                    "drivera gidicek");
                              },
                              icon: Icon(
                                Icons
                                    .drive_file_move_outline,
                                size: pageWidth / 8,
                              )),
                        ),
                      ]),
                ],
              )),
        );
      });
}