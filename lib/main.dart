import 'package:flutter/material.dart';
import 'package:phoenix/Pages/LoginPages/LoginPage.dart';


void main()async {


  runApp(const MyApp());
}

Future initialization(BuildContext context)async{
  await Future.delayed(Duration(seconds: 3));
}
class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);




  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Phoneix',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Login Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key,  this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Future<void> get()async{


  }

@override
  void initState() {
get();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginPage()

    );
  }
}
