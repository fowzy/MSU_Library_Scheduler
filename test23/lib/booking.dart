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
import 'package:test23/main.dart';
import 'package:enough_mail/enough_mail.dart';

Future<void> sendAnEmail(numberOfGuests, schedualingTime) async {
  String userName = 'msubooking@gmail.com';
  String password = 'msubooking123';
  String mNumber = mNumberController.text;
  String studentEmail = emailController.text;
  // String imapServerHost = 'imap.gmail.com';
  // int imapServerPort = 993;
  // bool isImapServerSecure = true;
  // String popServerHost = 'pop.gmail.com';
  // int popServerPort = 995;
  // bool isPopServerSecure = true;
  String smtpServerHost = 'smtp.gmail.com';
  int smtpServerPort = 465;
  bool isSmtpServerSecure = true;
  // final client = PopClient(isLogEnabled: false);
  // try {
  //   await client.connectToServer(popServerHost, popServerPort,
  //       isSecure: isPopServerSecure);
  //   await client.login(userName, password);
  //   // alternative login:
  //   // await client.loginWithApop(userName, password); // optional different login mechanism
  //   final status = await client.status();
  //   print(
  //       'status: messages count=${status.numberOfMessages}, messages size=${status.totalSizeInBytes}');
  //   final messageList = await client.list(status.numberOfMessages);
  //   print(
  //       'last message: id=${messageList?.first?.id} size=${messageList?.first?.sizeInBytes}');
  //   var message = await client.retrieve(status.numberOfMessages);
  //   message = await client.retrieve(status.numberOfMessages + 1);
  //   print('trying to retrieve newer message succeeded');
  //   await client.quit();
  // } on PopException catch (e) {
  //   print('POP failed with $e');
  // }
  final client = SmtpClient('enough.de', isLogEnabled: true);
  try {
    await client.connectToServer(smtpServerHost, smtpServerPort,
        isSecure: isSmtpServerSecure);
    await client.ehlo();
    await client.login(userName, password);
    final builder = MessageBuilder.prepareMultipartAlternativeMessage();
    builder.from = [
      MailAddress('MSU Library Scheduler', 'msubooking@gmail.com')
    ];
    // Dest. Email (Library Front Desk Email)
    builder.to = [MailAddress('$mNumberController.text', 'fwzsas@gmail.com')];
    builder.subject = '[Moffett Library] Study Room Scheduled';
    builder.addTextHtml(
        '<p>from: <b>MSU Library Scheduler</b></p>This email is confirmation for study room booking from Library Scheduler app.<br>Student M# $mNumber <br>Student email: $studentEmail <br>Room Capacity: $numberOfGuests guests.<br>Time Period: $schedualingTime <b>NOTE:</b>Make sure student show up at least 5 minutes ealier than the booking time and make sure you have your student your ID with you.<p><img src="https://i.ibb.co/1dp9sb4/unnamed.png"><br><b>Contact Moffett Library</b><br><b>Email: </b><a href="mailto:library@msutexas.edu" title="Email Moffett Library">library@msutexas.edu</a><br><b>Phone:</b><a href="tel:19403974204">(940) 397-4204</a><br><b>Toll-Free:</b><a href="tel:18002598518">(800) 259-8518</a>');
    final mimeMessage = builder.buildMimeMessage();
    final sendResponse = await client.sendMessage(mimeMessage);
    print('message sent: ${sendResponse.isOkStatus}');
  } on SmtpException catch (e) {
    print('SMTP failed with $e');
  }
}

// import 'package:booking_calendar/booking_calendar.dart';
List<String> getAvailableTime() {
  final now = DateTime.now();
  final currentHour = now.hour;
  List<String> time_list = [];
  if (currentHour > 23) {
    return ["No Available Time."];
  } else {
    int start = 8;
    if (currentHour > 8) {
      start = currentHour;
    }
    for (int i = start; i <= 23; i++) {
      time_list.add("$i - ${i + 1}");
    }
    return time_list;
  }
}

class Booking extends StatefulWidget {
  const Booking({Key? key}) : super(key: key);

  @override
  _BookingState createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  String schedualingTime = getAvailableTime()[0];
  String numberOfGuests = "1";
  @override
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
              backgroundColor: Color(0xff862633),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/logo.png',
                    height: 50,
                    width: 50,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text("Booking Page"),
                ],
              )),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Number of guests:"),
                DropdownButton<String>(
                  value: numberOfGuests,
                  icon: const Icon(Icons.person),
                  elevation: 16,
                  style: const TextStyle(color: Color(0xff862633)),
                  underline: Container(
                    height: 2,
                    color: Color(0xff862633),
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      numberOfGuests = newValue!;
                    });
                  },
                  items: <String>['1', '2', '3', 'More']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Text("Pick a time:"),
                ),
                DropdownButton<String>(
                  value: schedualingTime,
                  icon: const Icon(Icons.av_timer),
                  elevation: 16,
                  style: const TextStyle(color: Color(0xff862633)),
                  underline: Container(
                    height: 2,
                    color: Color(0xff862633),
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      schedualingTime = newValue!;
                    });
                  },
                  items: getAvailableTime()
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Color(0xff862633),
                        padding:
                            EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                    child: Text(
                      'Book',
                      style: TextStyle(fontSize: 16),
                    ),
                    onPressed: () {
                      sendAnEmail(numberOfGuests, schedualingTime);
                      showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: const Text('Thank you!'),
                          content: const Text(
                              'Your booking has been sent to the library.\nConfirmation will be sent to your email.'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () => Navigator.pop(context, 'Ok'),
                              child: const Text('Ok'),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
