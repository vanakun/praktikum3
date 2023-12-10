//Dava Nabila Muzaky 1462100153
import 'package:flutter/material.dart';
import 'package:prak_1/component/SplashScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late String nama;
  late String nbi;
  late String email;
  late String adress;
  late String instagram;

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
      email = prefs.getString('email') ?? '';
      adress = prefs.getString('adress') ?? '';
      instagram = prefs.getString('instagram') ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'SESI 9',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 32.0,
          ),
        ),
        backgroundColor: Colors.red,
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: Image.asset(
                      'assets/profile.jpg',
                      width: 150,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    nama,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    email,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  SizedBox(height: 26),
                  Container(
                    width: 350,
                    child: Card(
                      elevation: 2,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            SizedBox(height: 8),
                            _buildInfoRow('Nama', nama),
                            _buildDivider(),
                            _buildInfoRow('Nbi', nbi),
                            _buildDivider(),
                            _buildInfoRow('Kelas', 'PAB 9'), 
                            _buildDivider(),
                            _buildInfoRow('Email', email),
                            _buildDivider(),
                            _buildInfoRow('Alamat', adress), 
                            _buildDivider(),
                            _buildInfoRow('Instagram', instagram),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 26),
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
                          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
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
    
    );
  }

  
  Widget _buildInfoRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            color: Colors.blue,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  
  Widget _buildDivider() {
    return Divider();
  }
}
