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
import 'package:booking_calendar/booking_calendar.dart';

class Booking extends StatefulWidget {
  const Booking({Key? key}) : super(key: key);

  @override
  _BookingState createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  final now = DateTime.now();
  late BookingService mockBookingService;

  @override
  void initState() {
    super.initState();
    mockBookingService = BookingService(
        serviceName: 'Mock Service',
        serviceDuration: 30,
        bookingEnd: DateTime(now.year, now.month, now.day, 8, 0),
        bookingStart: DateTime(now.year, now.month, now.day, 18, 0));
  }

  Stream<dynamic>? getBookingStreamMock(
      {required DateTime end, required DateTime start}) {
    return Stream.value([]);
  }

  Future<dynamic> uploadBookingMock(
      {required BookingService newBooking}) async {
    await Future.delayed(const Duration(seconds: 1));
    converted.add(DateTimeRange(
        start: newBooking.bookingStart, end: newBooking.bookingEnd));
    print('${newBooking.toJson()} has been uploaded');
  }

  List<DateTimeRange> converted = [];

  List<DateTimeRange> convertStreamResultMock({required dynamic streamResult}) {
    ///here you can parse the streamresult and convert to [List<DateTimeRange>]
    DateTime first = now;
    DateTime second = now.add(Duration(minutes: 55));
    DateTime third = now.subtract(Duration(minutes: 240));
    DateTime fourth = now.subtract(Duration(minutes: 500));
    converted
        .add(DateTimeRange(start: first, end: now.add(Duration(minutes: 30))));
    converted.add(
        DateTimeRange(start: second, end: second.add(Duration(minutes: 23))));
    converted.add(
        DateTimeRange(start: third, end: third.add(Duration(minutes: 15))));
    converted.add(
        DateTimeRange(start: fourth, end: fourth.add(Duration(minutes: 50))));
    return converted;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            backgroundColor: Color(0xff862633), title: Text("Booking Page")),
        body: BookingCalendar(
          bookingService: mockBookingService,
          convertStreamResultToDateTimeRanges: convertStreamResultMock,
          getBookingStream: getBookingStreamMock,
          uploadBooking: uploadBookingMock,
        ),
      ),
    );
  }
}
