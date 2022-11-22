import 'package:flutter/material.dart';
import 'package:phoenix/DbService/PersonDao.dart';
import 'package:phoenix/Entity/Person.dart';
import 'package:phoenix/Pages/LoginPages/LoginPage.dart';
import 'package:phoenix/Validator/RegisterValidator.dart';



class RegisterPage extends StatefulWidget {
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  var _formKey = GlobalKey<FormState>();
  var _userNameCont = TextEditingController();
  var _nameCont = TextEditingController();
  var _surnameCont = TextEditingController();
  var _phoneNumCont = TextEditingController();
  var _passCont = TextEditingController();
  bool _isAgree = false;
  var _dateCont = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var pageScreen = MediaQuery.of(context).size;
    var pageHeight = pageScreen.height;
    var pageWidth = pageScreen.width;
    return Scaffold(
        body: Center(
            child: SingleChildScrollView(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                          width: pageWidth / 2.5,
                          height: pageWidth / 2.5,
                          child: Image.asset("Images/register.png")),
                      Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      bottom: pageHeight / 40,
                                      left: pageWidth / 15,
                                      right: pageWidth / 13),
                                  child: SizedBox(
                                      width: pageWidth / 2.6,
                                      child: TextFormField(
                                        controller: _nameCont,
                                        keyboardType: TextInputType.name,
                                        textCapitalization:
                                            TextCapitalization.words,
                                        textInputAction: TextInputAction.next,
                                        decoration: borderStyle("Name"),
                                        validator: (value) {
                                          return RegisterValidator()
                                              .checkName(value!);
                                        },
                                      )),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    bottom: pageHeight / 40,
                                  ),
                                  child: SizedBox(
                                    width: pageWidth / 2.6,
                                    child: TextFormField(
                                      controller: _surnameCont,
                                      keyboardType: TextInputType.name,
                                      textCapitalization:
                                          TextCapitalization.words,
                                      textInputAction: TextInputAction.next,
                                      decoration: borderStyle("SurName"),
                                      validator: (value) {
                                        return RegisterValidator()
                                            .checksurName(value!);
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  bottom: pageHeight / 40,
                                  left: pageWidth / 15,
                                  right: pageWidth / 15),
                              child: TextFormField(
                                controller: _userNameCont,
                                keyboardType: TextInputType.number,
                                textCapitalization: TextCapitalization.words,
                                textInputAction: TextInputAction.next,
                                decoration: borderStyle("UserName"),
                                validator: (value) {
                                  return RegisterValidator()
                                      .checkUserName(value!);
                                },
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  bottom: pageHeight / 40,
                                  left: pageWidth / 15,
                                  right: pageWidth / 15),
                              child: TextFormField(
                                controller: _dateCont,
                                keyboardType: TextInputType.datetime,
                                textCapitalization: TextCapitalization.words,
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(
                                        color: Colors.grey, width: 1.5),
                                  ),
                                  suffixIcon: GestureDetector(
                                    child: Icon(Icons.date_range),
                                    onTap: () {
                                      showDatePicker(
                                              context: context,
                                              initialDate: DateTime.now(),
                                              firstDate: DateTime(1980),
                                              lastDate: DateTime(2045))
                                          .then((value) {
                                        setState(() {
                                          String date =
                                              "${value!.day} : ${value.month} : ${value.year}";
                                          _dateCont.text = date;
                                        });
                                      });
                                    },
                                  ),
                                  label: Text("Date Of Birth",
                                      style: TextStyle(color: Colors.black54)),
                                ),
                                validator: (value) {
                                  return RegisterValidator().checkDate(value!);
                                },
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  bottom: pageHeight / 40,
                                  left: pageWidth / 15,
                                  right: pageWidth / 15),
                              child: TextFormField(
                                keyboardType: TextInputType.phone,
                                textCapitalization: TextCapitalization.words,
                                textInputAction: TextInputAction.next,
                                controller: _phoneNumCont,
                                decoration: borderStyle("Phone number"),
                                validator: (value) {
                                  return RegisterValidator()
                                      .checkPhoneNumber(value.toString());
                                },
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  bottom: pageHeight / 40,
                                  left: pageWidth / 15,
                                  right: pageWidth / 15),
                              child: TextFormField(
                                obscureText: true,
                                controller: _passCont,
                                keyboardType: TextInputType.text,
                                textCapitalization: TextCapitalization.words,
                                textInputAction: TextInputAction.next,
                                decoration: borderStyle("Password"),
                                validator: (value) {
                                  return RegisterValidator()
                                      .checkPass(value.toString());
                                },
                              ),
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding:
                                      EdgeInsets.only(left: pageWidth / 15),
                                  child: Checkbox(
                                      value: _isAgree,
                                      onChanged: (value) {
                                        setState(() {
                                          print(value);
                                          _isAgree = value!;
                                        });
                                      }),
                                ),
                                GestureDetector(
                                  onTap: () {

                                      gizlilikAlert();

                                  },
                                  child: Text(
                                    "User Privacy Policy",
                                    style: TextStyle(color: Colors.green),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding:
                                      EdgeInsets.only(right: pageWidth / 25),
                                  child: SizedBox(
                                      height: 40,
                                      width: 85,
                                      child: ElevatedButton(
                                          onPressed: () {
                                            setState(() {
                                              Navigator.pushAndRemoveUntil(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        LoginPage()),
                                                (route) => false,
                                              );
                                            });
                                          },
                                          child: const Text("Cancel"))),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: SizedBox(
                                    height: 40,
                                    width: 85,
                                    child: ElevatedButton(
                                        onPressed: () {
                                          var isCorrect =
                                              _formKey.currentState!.validate();
                                          setState(() {
                                            if (isCorrect) {
                                              var person = Person(
                                                name: _nameCont.text,
                                                surName: _surnameCont.text,
                                                userName: _userNameCont.text,
                                                phoneNum: _phoneNumCont.text,
                                                password: _passCont.text,
                                                date: _dateCont.text,
                                              );
                                              if (_isAgree) {
                                                addPerson(person).then((value) {
                                                  if (value) {
                                                    PersonDao()
                                                        .addPerson(person);
                                                    snackbar(context,
                                                        "Registration Successful");
                                                    Navigator.pushAndRemoveUntil(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                LoginPage()),
                                                        (route) => false);
                                                  } else {
                                                    snackbar(context,
                                                        "user available");
                                                  }
                                                });
                                              } else {
                                                snackbar(context,
                                                    "please check User Privacy Policy");
                                              }
                                            }
                                          });
                                        },
                                        child: const Text("Register")),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ]))));
  }

  gizlilikAlert() {
    showDialog(
        context: context,
        builder: (BuildContext contex) {
          return AlertDialog(
            title: Text("Gizlilik Sözlesmesi"),
            content: Text(
                " Quisque id sodales tellus. Curabitur bibendum enim a diam viverra vehicula. "
                "Fusce sagittis, arcu a consectetur faucibus, metus nisi faucibus lacus, a euismod tortor risus quis est."
                " Aenean vitae volutpat mauris. Duis nec elementum sem. Phasellus malesuada, justo ut hendrerit dictum, velit est ultrices est"
                ", nec dignissim augue nisi et justo. Phasellus placerat purus venenatis odio posuere, eget convallis ligula finibus."
                " Nulla at libero et quam sagittis aliquet dignissim nec nisi. Sed quis suscipit tellus, eu tincidunt orci."),
            actions: [
              TextButton(
                  onPressed: () {
                    setState(() {
                      Navigator.pop(context);
                      _isAgree = false;
                    });
                  },
                  child: Text("Exit")),
              TextButton(
                  onPressed: () {
                    setState(() {
                      _isAgree = true;
                      Navigator.pop(context);
                    });
                  },
                  child: Text("Accept")),
            ],
          );
        });
  }
}

Future<bool> addPerson(Person person) async {
  return await RegisterValidator().checkPersonExits(person);
}

borderStyle(name) {
  return InputDecoration(
    errorBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 2, color: Colors.red),
        borderRadius: BorderRadius.circular(20)),
    focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 2, color: Colors.red),
        borderRadius: BorderRadius.circular(20)),
    enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 2, color: Colors.black87),
        borderRadius: BorderRadius.circular(20)),
    focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 2, color: Colors.blueGrey),
        borderRadius: BorderRadius.circular(20)),
    label: Text(
      name,
      style: TextStyle(fontSize: 15.0),
    ),
    fillColor: Colors.white,
  );
}
snackbar(BuildContext context, message, {duration = 600}) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(message),
    duration: Duration(milliseconds: duration),
  ));
}
