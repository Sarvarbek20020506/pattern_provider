import 'package:flutter/material.dart';
import 'package:pattern_provider/pages/create_page.dart';
import 'package:pattern_provider/pages/home_page.dart';
import 'package:pattern_provider/pages/update_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
      routes: {
        HomePage.id : (context) =>HomePage(),
       UpdatePage.id : (context) =>UpdatePage(),
        CreatePage.id : (context) =>CreatePage()
      },
    );
  }
}

