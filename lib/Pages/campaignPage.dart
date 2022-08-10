
import 'package:flutter/material.dart';

class campaignPage extends StatefulWidget {

  @override
  State<campaignPage> createState() => _campaignPageState();
}

class _campaignPageState extends State<campaignPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: Center(
            child: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text( "Campaingn page"),
                  ]
              ),
            )
        )
    );
  }
}
