import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2), () async {
      String? userName = await getUserName();
      if (userName != null && userName.isNotEmpty) {
        Navigator.pushReplacementNamed(context, '/login');
      } else {
        Navigator.pushReplacementNamed(context, '/register');
      }
    });

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFF4500),
        automaticallyImplyLeading: false,
      ),
      backgroundColor: Color(0xFFFF4500),
      body: Center(
        child: Column(
          children: [
            Container(
              height: 130,
              child: Image.asset('assets/top.png'),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
            ),
            Container(
              height: 300,
              child: Image.asset('assets/middle.png'),
            ),
            Text(
              'PRAKTIKUM PAB 2023',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            Container(
              height: 280,
              child: Image.asset('assets/bottom.png'),
            ),
          ],
        ),
      ),
    );
  }

  Future<String?> getUserName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('name');
  }
}
