import 'package:flutter/material.dart';
import 'screens/home_page.dart'; // Import the HomePage screen
import 'screens/search_page.dart'; // Import the SearchPage if necessary

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LoL Heroes',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) =>
            HomePage(), // Ensure this points to the correct screen
        '/search': (context) => SearchPage(),
      },
    );
  }
}
