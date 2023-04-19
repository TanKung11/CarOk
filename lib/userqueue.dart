import 'package:flutter/material.dart';

class UserQueuePage extends StatefulWidget {
  const UserQueuePage({Key? key}) : super(key: key);

  @override
  _UserQueuePageState createState() => _UserQueuePageState();
}

class _UserQueuePageState extends State<UserQueuePage> {
  String? _selectedTime;

  final List<String> _availableTimes = [    '8:00 AM',    '8:30 AM',    '9:00 AM',    '9:30 AM',    '10:00 AM',    '10:30 AM',    '11:00 AM',    '11:30 AM',    '12:00 PM',    '12:30 PM',    '1:00 PM',    '1:30 PM',    '2:00 PM',    '2:30 PM',    '3:00 PM',    '3:30 PM',    '4:00 PM',    '4:30 PM',    '5:00 PM'  ];

  bool _bookingConfirmed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Queue Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Please select a time:',
            ),
            SizedBox(height: 20),
            DropdownButton<String>(
              hint: const Text('Select time'),
              value: _selectedTime,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedTime = newValue;
                });
              },
              items: _availableTimes
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_selectedTime != null) {
                  setState(() {
                    _bookingConfirmed = true;
                  });
                }
              },
              child: const Text('Confirm Booking'),
            ),
            if (_bookingConfirmed)
              Column(
                children: [
                  SizedBox(height: 20),
                  Text(
                    'You have booked the time:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    _selectedTime!,
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _bookingConfirmed = false;
                            _selectedTime = null;
                          });
                        },
                        child: const Text('Cancel Booking'),
                      ),
                      SizedBox(width: 20),
                      ElevatedButton(
                        onPressed: () {
                          // TODO: Perform booking logic here
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text('Booking Confirmed'),
                                content: Text(
                                    'You have booked the time: $_selectedTime'),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('OK'),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: const Text('Confirm'),
                      ),
                    ],
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
