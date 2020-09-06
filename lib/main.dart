import 'package:flutter/material.dart';
import 'package:zampichat/chat_screen.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'zampichat',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        iconTheme: IconThemeData(
          color: Color(0XFF40CF6C),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: TextStyle(color: Colors.white),
        ),
      ),
      home: ChatScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
