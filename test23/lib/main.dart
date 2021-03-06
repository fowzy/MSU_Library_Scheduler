import 'package:flutter/material.dart';
import 'package:test23/booking.dart';

void main() {
  runApp(const MyApp());
}

bool isNumeric(String s) {
  if (s == null) {
    return false;
  }
  return double.tryParse(s) != null;
}

validateMnumber(String Mnumber) {
  if (Mnumber.length != 9) {
    return false;
  }

  if (Mnumber[0].toUpperCase() != "M") {
    return false;
  }

  for (var i = 1; i < Mnumber.length; i++) {
    if (!isNumeric(Mnumber[i])) {
      return false;
    }
  }

  return true;
}

emailIsValid(String str) {
  final email_validation = RegExp(r'^[\w-.]+@(my.msutexas.edu)');
  return email_validation.hasMatch(str);
}

TextEditingController emailController = new TextEditingController();
TextEditingController mNumberController = new TextEditingController();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MSU Study Room',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          backgroundColor: Color(0xff862633),
          title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/logo.png',
                  height: 50,
                  width: 50,
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  'MSU Study Room',
                  style: TextStyle(fontSize: 22),
                ),
              ])),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Text('Number of student:'),
          SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            child: Transform.scale(
              scale: 0.90,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Please enter a valid student email:',
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                    child: TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                            borderSide: BorderSide(
                                color: Color(0xfffed322), width: 1.2)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                            borderSide: BorderSide(
                                color: Color(0xff862633), width: 1.2)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                            borderSide: BorderSide(
                                color: Color(0xff862633), width: 1.2)),
                        hintText: 'example@my.msutexas.edu',
                      ),
                    ),
                  ),
                  Text('Please enter your M#:'),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                    child: TextFormField(
                      controller: mNumberController,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                            borderSide: BorderSide(
                                color: Color(0xfffed322), width: 1.2)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                            borderSide: BorderSide(
                                color: Color(0xff862633), width: 1.2)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                            borderSide: BorderSide(
                                color: Color(0xff862633), width: 1.2)),
                        hintText: 'M12345678',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Color(0xff862633),
                          padding: EdgeInsets.symmetric(
                              horizontal: 50, vertical: 10),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                      child: Text(
                        'Next',
                        style: TextStyle(fontSize: 24),
                      ),
                      onPressed: () {
                        if (emailIsValid(emailController.text) &&
                            validateMnumber(mNumberController.text)) {
                          print("is valid");
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Booking()));
                        } else {
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: const Text('Alert'),
                              content: const Text('Please enter valid email'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () => Navigator.pop(context, 'Ok'),
                                  child: const Text('Ok'),
                                ),
                              ],
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
