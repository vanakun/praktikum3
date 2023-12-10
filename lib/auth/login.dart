import 'package:flutter/material.dart';
import 'package:prak_1/auth/pin.dart';
import 'package:prak_1/component/SplashScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late String nama;
  late String nbi;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      nama = prefs.getString('name') ?? '';
      nbi = prefs.getString('nbi') ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'SESI 9',
            style: TextStyle(
              color: const Color.fromARGB(255, 255, 255, 255),
              fontWeight: FontWeight.w900,
              fontSize: 32.0,
            ),
          ),
          backgroundColor: Colors.red,
          automaticallyImplyLeading: false,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
              ),
              Center(
                child: Text(
                  'Welcome to',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
              ),
              Center(
                child: Text(
                  'Praktikum PAB 2023',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 24,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
              ),
              Center(
                child: Text(
                  nbi,
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 20,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10.0),
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(
                        width: 250,
                        height: 400,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Image.asset(
                            'assets/example.jpeg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                      ),
                      Center(
                        child: Text(
                          nama,
                          style: TextStyle(
                            fontFamily: 'Monaco',
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Pin()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          primary: Colors.green,
                          padding: EdgeInsets.symmetric(horizontal: 120, vertical: 16),
                        ),
                        child: Text(
                          'Masuk',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () async {
                          final SharedPreferences prefs = await SharedPreferences.getInstance();
                          await prefs.clear();
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SplashScreen()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          primary: Colors.red,
                          padding: EdgeInsets.symmetric(horizontal: 120, vertical: 16),
                        ),
                        child: Text(
                          'Keluar',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
