import 'package:flutter/material.dart';
import 'package:random_resep/screen/calci_track_screen.dart';
import 'package:random_resep/screen/dummy_home.dart';
import 'package:random_resep/screen/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: dummyHomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
