// Booking is going to be a simple process
// Which user can book the room as the same day
// User has to choose the capacity of the room which is going to be
// 1, 2 or more than 2 which will show the user the room that are available
// for their capacity
// So user can only choose time which is going to be 2 hours booking standard
// User can't pick date or the lenght of staying of the room
// User can see all the timing available if the time not available then
// Time have to be blank or in another word UNCLICKABLE (Gray)
// Once the user choose the time then user go to confirmation page

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:test23/confirm.dart';

class Booking extends StatelessWidget {
  const Booking({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0xff862633), title: Text("Booking Page")),
      body: Container(
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              Text("Test"),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Color(0xff862633),
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                child: Text(
                  'Book',
                  style: TextStyle(fontSize: 24),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Confirmation()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
