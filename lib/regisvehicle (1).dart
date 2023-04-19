import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class RegisterVehiclePage extends StatefulWidget {
@override
_RegisterVehiclePageState createState() => _RegisterVehiclePageState();
}

class _RegisterVehiclePageState extends State<RegisterVehiclePage> {
File? _image;
final picker = ImagePicker();
List<String> _vehicleTypes = [
'รถกระบะ',
'รถเก๋ง',
'รถตู้',
'รถอื่น ๆ',
];
String? _selectedVehicleType;

Future getImage() async {
final pickedFile = await picker.pickImage(source: ImageSource.gallery);
setState(() {
if (pickedFile != null) {
_image = File(pickedFile.path);
} else {
print('No image selected.');
}
});
}

@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(
title: Text('ลงทะเบียนรถ'),
backgroundColor: Colors.grey[300],
),
body: Center(
child: Column(
mainAxisAlignment: MainAxisAlignment.center,
children: [
Container(
width: 200,
height: 200,
decoration: BoxDecoration(
color: Colors.grey[200],
borderRadius: BorderRadius.circular(100),
),
child: _image == null
? Center(child: Text('เลือกรูปภาพ'))
: ClipRRect(
borderRadius: BorderRadius.circular(100),
child: Image.file(
_image!,
fit: BoxFit.cover,
),
),
),
SizedBox(height: 20),
ElevatedButton(
onPressed: getImage,
child: Text('เลือกรูปภาพ'),
),
SizedBox(height: 20),
Container(
width: 300,
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Text(
'กรุณาเลือกประเภทรถ',
style: TextStyle(
fontWeight: FontWeight.bold,
fontSize: 16,
),
),
SizedBox(height: 10),
DropdownButton<String>(
value: _selectedVehicleType,
onChanged: (String? newValue) {
setState(() {
_selectedVehicleType = newValue;
});
},
items: [
'Honda',
'Toyota',
'Mitsubishi',
'Nissan',
'Isuzu',
].map<DropdownMenuItem<String>>((String value) {
return DropdownMenuItem<String>(
value: value,
child: Text(value),
);
}).toList(),
),
],
),
),
SizedBox(height: 20),

Container(
  width: 300,
  child: TextFormField(
    decoration: InputDecoration(
      labelText: 'กรุณากรอกป้ายทะเบียนรถ',
      border: OutlineInputBorder(),
    ),
  ),
),
SizedBox(height: 20),
ElevatedButton(
onPressed: () {
// ใส่โค้ดเพื่อทำงานเมื่อปุ่มถูกกด
},

child: Text('ยืนยัน'),
),
],
),
),
);
}
}

