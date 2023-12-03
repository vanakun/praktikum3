import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () async {
      String? userName = await getUserName();
      if (userName != null && userName.isNotEmpty) {
        Navigator.pushReplacementNamed(context, '/login');
      } else {
        Navigator.pushReplacementNamed(context, '/register');
      }
    });

    return Scaffold(
      backgroundColor: Color(0xFFFF4500), 
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/top.png'),
          Image.asset('assets/middle.png',scale: 3,),
          Text(
            'PRAKTIKUM PAB 2023',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w800,
              color: Colors.black, 
            ),
            textAlign: TextAlign.center, 
          ),
          Image.asset('assets/bottom.png'),
        ],
      ),
    );
  }
    Future<String?> getUserName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('name');
  }
}
