import 'package:api_course/exampleTwo.dart';
import 'package:api_course/example_fiver.dart';
import 'package:api_course/examplefour.dart';
import 'package:api_course/examplethree.dart';
import 'package:api_course/home_screen.dart';
import 'package:api_course/signup.dart';
import 'package:api_course/upload_image.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const UploadImageScreen());
  }
}
