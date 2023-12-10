//Dava Nabila Muzaky 1462100153
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController nbiController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController adressController = TextEditingController();
  TextEditingController instagramController = TextEditingController();

  bool validateData() {
  return nameController.text.isNotEmpty &&
      nbiController.text.isNotEmpty &&
      emailController.text.isNotEmpty &&
      adressController.text.isNotEmpty &&
      instagramController.text.isNotEmpty;
  }

   Future<void> _showMyDialog(context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Fields Tidak boleh kosong',
            style: TextStyle(fontSize: 15),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Kembali'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/regis.png',
                    height: 140,
                  ),
                ],
              ),
              SizedBox(height: 1), 
              Text(
                'WELCOME',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w900,
                ),
              ),
              Text(
                'Praktikum PAB 2023',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 35),
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: 'Nama',
                  hintText: 'Masukan Nama ',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: nbiController,
                decoration: InputDecoration(
                  labelText: 'Nbi',
                  hintText: 'Masukan Nbi ',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  hintText: 'Masukan Email ',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: adressController,
                decoration: InputDecoration(
                  labelText: 'Address',
                  hintText: 'Masukan Address ',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: instagramController,
                decoration: InputDecoration(
                  labelText: 'Instagram',
                  hintText: 'Masukan Instagram ',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: () async {             
                  if (validateData()) {
                    await saveUserData();
                    Navigator.pushReplacementNamed(context, '/login');
                  } else {
                  _showMyDialog(context);
                  }
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  primary: Colors.green,
                  minimumSize: Size(double.infinity, 50),
                ),
                child: Text(
                  'Daftar',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> saveUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('name', nameController.text);
    prefs.setString('nbi', nbiController.text);
    prefs.setString('email', emailController.text);
    prefs.setString('adress', adressController.text);
    prefs.setString('instagram', instagramController.text);
  }
}
