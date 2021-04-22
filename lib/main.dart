import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hospitals_app/screens/hospital_lists.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hospitals List',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: HospitalListScreen(),
    );
  }
}
