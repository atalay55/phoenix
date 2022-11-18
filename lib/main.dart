import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:phoenix/Pages/LoginPages/LoginPage.dart';


void main()async {


  FlutterNativeSplash.removeAfter(initialization);
  runApp(MyApp());
}

Future initialization(BuildContext context)async{
  await Future.delayed(Duration(seconds: 2));
}
class MyApp extends StatelessWidget {





  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Phoneix',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  MyHomePage(title: 'Login Page', key: Key("key"),),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({required Key key,  required this.title}) : super(key: key);

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
