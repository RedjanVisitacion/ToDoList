import 'package:flutter/material.dart';
import 'package:practice_app/pages/home_page.dart';

void main() {
  runApp(MyFirstApp());
}

class MyFirstApp extends StatelessWidget {
  const MyFirstApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'RPSV\'s TODO LIST',
      home: HomePage(),
    );
  }
}
