import 'package:flutter/material.dart';

class CanliDestek extends StatefulWidget {
  @override
  State<CanliDestek> createState() => _CanliDestekState();
}

class _CanliDestekState extends State<CanliDestek> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: SingleChildScrollView(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text("Canli Destek"),
      ]),
    )));
  }
}
