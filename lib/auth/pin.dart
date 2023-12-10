import 'package:flutter/material.dart';
import 'package:prak_1/component/BottomNavigationBar.dart';
import 'package:prak_1/pages/home.dart';
import 'package:prak_1/pages/news.dart';

class Pin extends StatefulWidget {
  const Pin({Key? key}) : super(key: key);

  @override
  State<Pin> createState() => LoginState();
}

class LoginState extends State<Pin> {
  TextEditingController _pinController = TextEditingController();

   int _currentIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
            title: Text(
              'SESI 9',
              style: TextStyle(
                color: const Color.fromARGB(255, 255, 255, 255),
                fontWeight: FontWeight.bold,
                fontSize: 32.0,
              ),
            ),
            backgroundColor: Colors.red,
            automaticallyImplyLeading: false,
          ),
      body: Padding(
        padding: const EdgeInsets.all(75.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Enter Your PIN',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Text(
              'Please enter your PIN that you have created',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8),
            Image.asset(
              'assets/key.png',
              width: 150,
              height: 120,
            ),
            SizedBox(height: 8),
            Container(
              width: 180,
              height: 50,
              child: PinTextField(controller: _pinController),
            ),
            SizedBox(height: 30),
            Container(
              width: 115,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  String enteredPin = _pinController.text;
                  if (enteredPin == 'Daskom9') {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('PIN salah. Coba lagi.'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                ),
                child: Center(
                  child: Container(
                    width: 70,
                    height: 70,
                    child: Image.asset(
                      'assets/key_open.png',
                      width: 70,
                      height: 70,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PinTextField extends StatefulWidget {
  final TextEditingController controller;

  PinTextField({required this.controller});

  @override
  _PinTextFieldState createState() => _PinTextFieldState();
}

class _PinTextFieldState extends State<PinTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      keyboardType: TextInputType.text,
      obscureText: true,
      maxLength: 10,
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 18),
      decoration: InputDecoration(
        hintText: 'Enter PIN',
        counterText: '',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
