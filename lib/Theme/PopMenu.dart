import 'package:flutter/material.dart';
import 'package:phoenix/Pages/LoginPages/LoginPage.dart';

class PopMenu extends StatelessWidget {
   List<String>? poplist ;

  PopMenu( {this.poplist});


  @override
  Widget build(BuildContext context) {
   return popMenuAppBar(context, poplist);

  }

   gizlilikAlert(context) {
     showDialog(
         context: context,
         builder: (BuildContext contex) {
           return AlertDialog(
             title: Text("Gizlilik Sözlesmesi"),
             content: Text(" Quisque id sodales tellus. Curabitur bibendum enim a diam viverra vehicula. "
                 "Fusce sagittis, arcu a consectetur faucibus, metus nisi faucibus lacus, a euismod tortor risus quis est."
                 " Aenean vitae volutpat mauris. Duis nec elementum sem. Phasellus malesuada, justo ut hendrerit dictum, velit est ultrices est"
                 ", nec dignissim augue nisi et justo. Phasellus placerat purus venenatis odio posuere, eget convallis ligula finibus."
                 " Nulla at libero et quam sagittis aliquet dignissim nec nisi. Sed quis suscipit tellus, eu tincidunt orci."),
             actions: [
               TextButton(
                   onPressed: () {
                     Navigator.pop(context);
                   },
                   child: Text("Simdi degil")),
               TextButton(
                   onPressed: () {
                     Navigator.pop(context);
                   },
                   child: Text("Kabul et")),
             ],
           );
         });
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



}
