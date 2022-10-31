import 'package:flutter/material.dart';
import 'package:phoenix/Entity/Person.dart';
import 'package:phoenix/Pages/CardPage.dart';
import 'package:phoenix/Pages/ProductPages/GridViewPage.dart';
import 'package:phoenix/Pages/ProductPages/ProductAddPage.dart';
import 'package:phoenix/Pages/ProfilePage.dart';
import 'package:phoenix/Pages/campaignPage.dart';
import 'package:phoenix/Theme/PopMenu.dart';

class HomePage extends StatefulWidget {
   Person _person;

  HomePage(this._person);

  HomePage.empty();

  @override
  State<HomePage> createState() => _MainPageState();
}

class _MainPageState extends State<HomePage> {
  int item = 0;
  bool isSearch = false;
  bool showSearchBar = true;
  String search;
  var title = "Anka";
  var poplist=["exit"];


  @override
  Widget build(BuildContext context) {
    var page = MediaQuery.of(context).size;
    var pageWidth = page.width;
    List<Widget> pageList = [
      GridViewPage(isSearch, search,widget._person),
      ProfilePage(widget._person),
      campaignPage(),
      ProductAddPage(),
      CardPage.empty()
    ];
    return Scaffold(
      appBar:showSearchBar
          ? AppBar(
              backgroundColor: Colors.purpleAccent,
              title: isSearch
                  ? TextField(
                      decoration: const InputDecoration(
                        filled: true,
                        hintText: " search",
                      ),
                      onChanged: (arama) {
                        setState(() {
                          search = arama;
                        });
                      },
                    )
                  : GestureDetector(
                      onTap: () {
                        setState(() {
                          isSearch = true;
                        });
                      },
                      child: Text(
                        title,
                        style: const TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontStyle: FontStyle.italic),
                      )),
              actions: [
                  isSearch
                      ? IconButton(
                          onPressed: () {
                            setState(() {
                              isSearch = false;
                            });
                          },
                          icon: const Icon(Icons.cancel))
                      : IconButton(
                          onPressed: () {
                            setState(() {
                              isSearch = true;
                            });
                          },
                          icon:const  Icon(Icons.search)),
                    IconButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>CardPage(widget._person.id.toString())));
                      }, icon: Icon(Icons.shopping_bag)),
                ])
          : AppBar(
             backgroundColor: Colors.purpleAccent,
              title: Text(title),
            ),
      body: pageList[item],
      drawer: Drawer(
        child: ListView(
          children: [
            SizedBox(
              height: pageWidth / 3,
              child: DrawerHeader(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                            width: pageWidth / 4,
                            height: pageWidth/8,
                            child: Image.asset("Images/anka.png")),
                        const Padding(
                          padding:  EdgeInsets.only(left: 12),
                          child:  Text(
                            "Anka",
                            style: TextStyle(fontSize: 24, fontStyle: FontStyle.italic,),
                          ),
                        )
                      ],
                    ),Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                        children: [popMenuAppBar(context, poplist)]),
                  ],
                ),
                decoration: BoxDecoration(
                 color:Colors.purple
                ),
              ),
            ),
            ListTile(
              title: Text("Anasayfa"),
              selectedColor: Colors.blueAccent,
              onTap: () {
                setState(() {
                  showSearchBar = true;
                  title = "Anka";
                  item = 0;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text("Profile"),
              selectedColor: Colors.blueAccent,
              onTap: () {
                setState(() {
                  showSearchBar = false;
                  title = "Profile ";
                  item = 1;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text("Campain "),
              selectedColor: Colors.blueAccent,
              onTap: () {
                setState(() {
                  showSearchBar = false;
                  title = "Campain ";
                  item = 2;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text("ProductAdd "),
              selectedColor: Colors.blueAccent,
              onTap: () {
                setState(() {
                  showSearchBar = false;
                  title = "ProductAdd ";
                  item = 3;
                });
                Navigator.pop(context);
              },
            ), ListTile(
              title: Text("CardPage "),
              selectedColor: Colors.blueAccent,
              onTap: () {
                setState(() {
                  showSearchBar = false;
                  title = "Card Page";
                  item = 4;
                });
                Navigator.pop(context);
              },
            ),

          ],
        ),
      ),
    );
  }
}


