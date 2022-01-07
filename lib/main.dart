import 'package:flutter/material.dart';

import 'Home.dart';

void main() => runApp(const MyApp());


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
       canvasColor: Colors.transparent,
        primarySwatch: Colors.teal,
        iconTheme: const IconThemeData(color: Colors.white, size: 30),
        textTheme: const TextTheme
        (
          headline1: TextStyle
          (
            fontSize: 45,
            fontWeight: FontWeight.w800,
            color: Colors.white
          ),
          headline2: TextStyle
          (
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.black
          ),
          bodyText1: TextStyle
          (
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Colors.black87
          ),
        )
      ),
      home: const MyHomePage(),
    );
  }
}

