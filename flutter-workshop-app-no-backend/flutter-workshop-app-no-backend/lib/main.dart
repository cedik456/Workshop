import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_workshop_app/screens.dart';

Future <void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid 
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
          apiKey: "AIzaSyB3ii-0_VIKd-zNnrqJSlHqmVzkZM4h4Uk",
          appId: "1:744555969241:android:99b500a5d3fe930c19dcc8",
          messagingSenderId: "744555969241",
          projectId: "flutter-workshop-a2527",
        ))
        : await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Threads',
        theme: ThemeData(
          fontFamily: 'Roboto',
          useMaterial3: true,
        ),
        home: const LoginPage());
  }
}
