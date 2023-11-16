import 'package:flutter/material.dart';
import 'package:random_resep/screen/calci_track_screen.dart';
import 'package:random_resep/screen/dummy/dummy_home.dart';
import 'package:random_resep/screen/home_screen.dart';
import 'package:random_resep/screen/homepage_screen.dart';
import 'package:random_resep/screen/welcome_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: WelcomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
