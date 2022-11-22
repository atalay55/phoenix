import 'package:flutter/material.dart';
import 'package:phoenix/Entity/Person.dart';
import 'package:phoenix/Pages/CardPage.dart';
import 'package:phoenix/Pages/ProductPages/GridViewPage.dart';
import 'package:phoenix/Pages/ProductPages/ProductAddPage.dart';
import 'package:phoenix/Pages/ProfilePage.dart';
import 'package:phoenix/Pages/campaignPage.dart';
import 'package:phoenix/Theme/PopMenu.dart';

class HomePage extends StatefulWidget {
   Person? _person;

  HomePage(this._person);

  HomePage.empty();

  @override
  State<HomePage> createState() => _MainPageState();
}

class _MainPageState extends State<HomePage> {
  int item = 0;
  bool isSearch = false;
  bool showSearchBar = true;
  String? search;
  var title = "Phoneix";
  var poplist=["exit"];


  @override
  Widget build(BuildContext context) {
    var page = MediaQuery.of(context).size;
    var pageWidth = page.width;
    var pageHight = page.height;
    List<Widget> pageList = [
      GridViewPage(isSearch, search.toString(),widget._person!),
      ProfilePage(widget._person!),
      campaignPage(),
      ProductAddPage(),
      CardPage(widget._person!.id.toString())
    ];
    return Scaffold(

      appBar:
      showSearchBar
          ? AppBar(
              backgroundColor: Colors.indigoAccent,
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
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>CardPage(widget._person!.id.toString())));
                      }, icon: Icon(Icons.shopping_bag)),
                ])
          : AppBar(
             backgroundColor: Colors.indigoAccent,
              title: Text(title),
            ),
      body: pageList[item],
      drawer: Drawer(

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: pageWidth,
              height:pageHight/1.1,
              child: ListView(
                children: [

                  UserAccountsDrawerHeader(
                    accountName: Text("Phoneix"),
                    currentAccountPicture: CircleAvatar(
                      backgroundImage: AssetImage("Images/deneme1.png"),
                      backgroundColor: Colors.white,
                    ),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          "https://media.istockphoto.com/photos/abstract-composition-with-connecting-dots-"
                              "and-lines-and-triangles-picture-id1361855796?b=1&k=20&m=1361855796&s=170667a&w="
                              "0&h=ntG3yH87Uxz7n6fDQNAe-58HuOsuBDm_cgIaDFZSVoc=",
                        ),
                        fit: BoxFit.fill,
                      ),
                    ), accountEmail: null,

                  ),
                  ListTile(
                    title: Text("HomePage"),
                    selectedColor: Colors.blueAccent,
                    onTap: () {
                      setState(() {
                        showSearchBar = true;
                        title = "Phoneix";
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
                  ),

                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [IconButton(onPressed: (){
                PopMenu().exitAlert(context);
              }, icon: Icon(Icons.close))],
            )
          ],
        ),
      ),
    );
  }
}


