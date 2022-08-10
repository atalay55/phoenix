
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:phoenix/Entity/Person.dart';
import 'package:phoenix/Pages/GridViewPage.dart';
import 'package:phoenix/Pages/ProfilePage.dart';
import 'package:phoenix/Pages/SettingPage.dart';
import 'package:phoenix/Pages/campaignPage.dart';

class HomePage extends StatefulWidget{
  Person person;
  HomePage(this.person);
  HomePage.empty();

  @override
  State<HomePage> createState() => _MainPageState();
}

class _MainPageState extends State<HomePage> {

  int item =0;
  bool isSearch=false;
  bool showSearchBar =true;
  var title="Anka";
  @override
  Widget build(BuildContext context) {
    var page = MediaQuery.of(context).size;
    var pageWidth=page.width;
    List<Widget> pageList=[GridViewPage(),ProfilePage(widget.person),campaignPage(),];
    return Scaffold(
        appBar:showSearchBar? AppBar(
        title: isSearch ? TextField(
          decoration: InputDecoration(
            filled: true,
            hintText: " search", ),
          onChanged:(arama){
          print(arama);
          },
        ):Text(title ,style: TextStyle(fontSize: 25,color: Colors.white,fontStyle: FontStyle.italic),),
        actions: [
            isSearch ? IconButton(onPressed: (){setState(() {
              isSearch=false;
            });}, icon: Icon(Icons.cancel)):IconButton(onPressed: (){
              setState(() {
                isSearch=true;
              });
            }, icon: Icon(Icons.search)),
          ]
      ):AppBar(title: Text(title),),
      body:pageList[item],

      drawer:Drawer( child: ListView(
        children: [
          SizedBox(
            height:pageWidth/3 ,
            child:  DrawerHeader(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                          width: pageWidth/4
                          ,child: Image.asset("Images/mainphoto.jpg")),
                      Padding(
                        padding: EdgeInsets.only(left: 12),
                        child: Text("Baslık",style: TextStyle(fontSize: 14),),
                      )
                    ],
                  ),
                ],
              ),

              decoration: BoxDecoration(color: Colors.black45,),
            ),
          ),
          ListTile(
            title: Text("Anasayfa"),
            selectedColor: Colors.blueAccent,
            onTap: () {
              setState(() {
                showSearchBar=true;
                title="Anka";
                item =0;
              });
              Navigator.pop(context);
            },
          ),


          ListTile(
            title: Text("Profile"),
            selectedColor: Colors.blueAccent,
            onTap: () {
              setState(() {
                showSearchBar=false;
                title="Profile ";
                item =1;
              });
              Navigator.pop(context);
            },
          ),


          ListTile(
            title: Text("Campain "),
            selectedColor: Colors.blueAccent,
            onTap: () {
              setState(() {
                showSearchBar=false;
                title="Campain ";
                item =2;
              });
              Navigator.pop(context);
            },
          ),

        ],
      ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex:item  ,
        backgroundColor: Colors.white38,
        items: [
          BottomNavigationBarItem(
            label: "",
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: "",
            icon: Icon(Icons.person),

          ),
          BottomNavigationBarItem(
            label: "",
            icon: Icon(Icons.campaign),
          ),
        ],
        onTap: (value){
          setState(() {
            if(value==0){
              showSearchBar=true;
              title="Anka";
            }
            if(value==1){
              showSearchBar=false;
              title="Profile";
            }
            if(value==2){
              showSearchBar=false;
              title="Campain";
            }
            item=value;
          });

        },

      )

    );

  }

}







