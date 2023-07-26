import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'navbar.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      theme:  ThemeData(
        scaffoldBackgroundColor: Colors.white,
      )
    ); // Material App
  }
}