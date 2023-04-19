import 'package:first_app/queue2.dart';

import './login2.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import './service/database.dart';
import './regisvehicle.dart';
import './map2.dart';
import './queue.dart';
import './userqueue.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter with firebase',
      home: Scaffold(
        body: LoginPage()
      ),
    );
  }
}
