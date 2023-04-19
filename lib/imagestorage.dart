import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddImagePage extends StatefulWidget {
  @override
  _AddImagePageState createState() => _AddImagePageState();
}

class _AddImagePageState extends State<AddImagePage> {
  String imagePath = '';
  String imageDescription = '';

  Future<void> _getImage() async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      setState(() {
        imagePath = pickedFile.path;
      });
    }
  }

  void _setDescription(String description) {
    setState(() {
      imageDescription = description;
    });
  }

  void _saveImage() {
    // โค้ดสำหรับเก็บข้อมูลรูปภาพลงฐานข้อมูล
    // โดยใช้ class ที่คุณได้สร้างไว้
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Image'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // แสดงรูปภาพที่เลือก
            imagePath == null
                ? Container(
                    height: 200,
                    color: Colors.grey[300],
                    child: Center(
                      child: Text('No image selected'),
                    ),
                  )
                : Container(
                    height: 200,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: FileImage(
                          File(imagePath),
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
            SizedBox(height: 16),
            // ปุ่มเพื่อเลือกรูปภาพ
            ElevatedButton(
              onPressed: _getImage,
              child: Text('Select Image'),
            ),
            SizedBox(height: 16),
            // TextField สำหรับใส่คำอธิบายรูปภาพ
            TextField(
              decoration: InputDecoration(
                labelText: 'Image Description',
                border: OutlineInputBorder(),
              ),
              onChanged: _setDescription,
            ),
            SizedBox(height: 16),
            // Row สำหรับปุ่ม Save
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: _saveImage,
                    child: Text('Save'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
