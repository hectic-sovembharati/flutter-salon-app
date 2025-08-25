import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class BookingPage extends StatefulWidget {
  final String serviceName;
  final String price;
  final String duration;

  const BookingPage({super.key, 
    required this.serviceName,
    required this.price,
    required this.duration,
  });

  @override
  _BookingPageState createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  String? selectedTime;
  String? selectedDay;

  final List<String> timeSlots = [
    "9:00 AM",
    "10:00 AM",
    "11:00 AM",
    "12:00 PM",
    "1:00 PM",
    "2:00 PM",
    "3:00 PM",
    "4:00 PM",
    "5:00 PM",
    "6:00 PM",
    "7:00 PM",
    "8:00 PM",
    "9:00 PM",
  ];

  final List<String> daysOfWeek = const [
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
    "Sunday",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Book Appointment")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.serviceName,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text("Price: \$${widget.price}"),
            Text("Duration: ${widget.duration}"),
            SizedBox(height: 20),
            Text("Choose Day",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 12),
            DropdownButtonFormField<String>(
              value: selectedDay,
              hint: Text("Select Day"),
              items: daysOfWeek.map((day) {
                return DropdownMenuItem<String>(
                  value: day,
                  child: Text(day),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedDay = value;
                });
              },
            ),
            SizedBox(height: 20),
            Text("Choose Time",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 12),
            DropdownButtonFormField<String>(
              value: selectedTime,
              hint: Text("Select Time"),
              items: timeSlots.map((time) {
                return DropdownMenuItem<String>(
                  value: time,
                  child: Text(time),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedTime = value;
                });
              },
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                if (selectedTime != null && selectedDay != null) {
                  var box = Hive.box('bookingsBox');
                  box.add({
                    'service': widget.serviceName,
                    'price': widget.price,
                    'duration': widget.duration,
                    'time': selectedTime,
                    'day': selectedDay,
                  });

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content: Text(
                            "Booked ${widget.serviceName} on $selectedDay at $selectedTime")),
                  );
                  Navigator.pop(context);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Please select a day and time")),
                  );
                }
              },
              child: Text("Confirm Booking"),
            ),
          ],
        ),
      ),
    );
  }
}
