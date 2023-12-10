//Dava Nabila Muzaky 1462100153

import 'package:flutter/material.dart';
import 'package:prak_1/auth/Register.dart';
import 'package:prak_1/auth/login.dart';
import 'package:prak_1/auth/pin.dart';
import 'package:prak_1/component/SplashScreen.dart';
import 'package:prak_1/pages/detail.dart';
import 'package:prak_1/pages/home.dart';
import 'package:prak_1/pages/news.dart';
import 'package:prak_1/pages/profile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Apps',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      routes: {
        '/register': (context) => RegisterPage(),
        '/login': (context) => Login(),
        '/home': (context) => HomePage(),
        '/detail': (context) => DetailPage(),
        '/pin': (context) => Pin(),
        '/news': (context) => NewsScreen(),
        '/profile': (context) => ProfileScreen(),
      },
    );
  }
}
