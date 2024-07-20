import 'package:flutter/material.dart';
import 'screens/Homescreen.dart';

void main() {
  runApp(MilitaryPhotoApp());
}

class MilitaryPhotoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Military Photo Archive',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
      debugShowCheckedModeBanner: false, // This line removes the debug banner
    );
  }
}
