import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {

  @override
  State<SettingPage> createState() => _SettingPage();
}

class _SettingPage extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: Center(
            child: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Settings  Page"),
                  ]
              ),
            )
        )
    );
  }
}
