import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:two/product_detail.dart'; // Import the ProductDetailsScreen
import 'package:two/signup.dart';
import 'package:two/signin.dart';
import 'package:two/splash_screen.dart';

import 'firebase_options.dart';
import 'home.dart'; // Import the LoginScreen

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-commerce App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreen(), // Set the LoginScreen as the home screen
    );
  }
}
