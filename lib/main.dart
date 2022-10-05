import 'package:flutter/material.dart';
import 'package:phoenix/DbService/PersonDao.dart';
import 'package:phoenix/Entity/Person.dart';
import 'package:phoenix/Pages/LoginPages/LoginPage.dart';


void main() {
  runApp(const MyApp());
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

  Future<void> getAll()async{
    List<Person> users = await PersonDao().getAll();

    for(Person p in users){
      print(p.personelNum);
      print(p.password);
    }
  }
@override
  void initState() {
    getAll();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginPage()

    );
  }
}
