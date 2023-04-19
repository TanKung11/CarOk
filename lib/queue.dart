import 'package:flutter/material.dart';

class QueuePage extends StatefulWidget {
  @override
  _QueuePageState createState() => _QueuePageState();
}

class _QueuePageState extends State<QueuePage> {
  // กำหนดเวลาเปิด-ปิด
  final DateTime _openTime = DateTime(2022, 3, 17, 8, 0, 0); // 8 A.M.
  final DateTime _closeTime = DateTime(2022, 3, 17, 17, 0, 0); // 5 P.M.

  // ตรวจสอบเวลาว่าอยู่ในช่วงเวลาเปิด-ปิดหรือไม่
  bool isTimeInRange(DateTime time) {
    return time.isAfter(_openTime) && time.isBefore(_closeTime);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('จองคิวล้างรถ'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('เวลาเปิด-ปิด: 8 A.M. - 5 P.M.'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // ตรวจสอบเวลาก่อนทำการจอง
                DateTime currentTime = DateTime.now();
                if (isTimeInRange(currentTime)) {
                  // สามารถจองได้ในช่วงเวลาเปิด-ปิด
                  // เพิ่มโค้ดสำหรับการจองคิวที่นี่
                  print('ทำการจองคิว');
                } else {
                  // ไม่สามารถจองได้เนื่องจากไม่ได้อยู่ในช่วงเวลาเปิด-ปิด
                  print('ไม่สามารถจองได้ในขณะนี้');
                }
              },
              child: Text('จองคิวล้างรถ'),
            ),
          ],
        ),
      ),
    );
  }
}
