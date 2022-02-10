import 'package:flutter/material.dart';

// TODO: Put a spacer before each widget
// TODO: Use "regex" to validate the email and student id number and put the logic
// TODO: Build "Error" Page with <button> "Try Again" or "Go Back"
// TODO: Expand widget to make sure the app will fits all screen
// TODO: for Styling choose the color of MSU branding #862633
// Background white and button and bar has to be MSU color
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MSU Study Room',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool validMID = false;
  bool validEmail = false;
  // our logic right here and function should be before override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.red,
          title: Row(children: <Widget>[
            Image(
              height: 30,
              image: NetworkImage(
                  'https://msumustangs.com/images/logos/site/site.png'),
            ),
            Text('MSU Study Room'),
          ])),
      body: Container(
        padding: new EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Please enter a valid student email:',
            ),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'example@my.msutexas.edu',
              ),
            ),
            Text('Please enter your M#:'),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'M12345678',
              ),
            ),
            FlatButton(
              color: Colors.red,
              textColor: Colors.white, // foreground
              onPressed: () {
                // once the user click the button
                // run the check function using regex
                // if both are valid switch boolen to true
                // validMID & validEmail == true then go to
                // confirm.dart
                // else go to error.dart
              },
              child: Text('Enter'),
            ),
          ],
        ),
      ),
    );
  }
}
