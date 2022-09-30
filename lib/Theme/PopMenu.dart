import 'package:flutter/material.dart';
import 'package:phoenix/Pages/LoginPages/LoginPage.dart';

class PopMenu extends StatelessWidget {
   List<String> poplist ;

  PopMenu( {this.poplist});


  @override
  Widget build(BuildContext context) {
    return popMenuAppBar(context, poplist);

  }
}

exitAlert(context) {
  showDialog(
      context: context,
      builder: (BuildContext contex) {
        return AlertDialog(
          content: Text("Do you want to exit"),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("No")),
            TextButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (contex)=>LoginPage()), (route) => false);
                },
                child: Text("yes")),
          ],
        );
      });
}

popMenuAppBar(context,poplist) {
 return PopupMenuButton(
    itemBuilder: (context) =>
        poplist
            .map<PopupMenuItem>(
                (element) =>
                PopupMenuItem(
                    child: Text(element), value: poplist.indexOf(element)))
            .toList(),
    onSelected: (selectedValue) {
      if (selectedValue == 0) {
        exitAlert(context);
      }
    },
  );
}