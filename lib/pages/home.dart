import 'package:flutter/material.dart';
import 'package:prak_1/component/BottomNavigationBar.dart';
import 'package:prak_1/pages/detail.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        automaticallyImplyLeading: false, // Menghapus tombol back
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    height: 130 - 20,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(3),
                      child: Image.asset('assets/profile.jpg'),
                    ),
                  ),
                  SizedBox(width: 10),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Live Now',
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '11.11 Sale',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    child: Container(
                      width: 120.0,
                      height: 125.0,
                      child: Card(
                       child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center, // Center text vertically
                            children: [
                              Text(
                                '11.11',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                '19 PM',
                                style: TextStyle(
                                  fontSize: 12, // Set the desired smaller font size
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => DetailPage()),
                      );
                    },
                  ),
                  GestureDetector(
                    child: Container(
                      width: 120.0,
                      height: 125.0,
                      child: Card(
                        child: Center(
                          child: Text(
                            'Gratis\nOngkir',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => DetailPage()),
                      );
                    },
                  ),
                  GestureDetector(
                    child: Container(
                      width: 120.0,
                      height: 125.0,
                      child: Card(
                        child: Center(
                          child: Text(
                            'Flash\nSale',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => DetailPage()),
                      );
                    },
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    child: Container(
                      width: 120.0,
                      height: 125.0,
                      child: Card(
                        child: Center(
                          child: Text(
                            'Murah\nLebay',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => DetailPage()),
                      );
                    },
                  ),
                  GestureDetector(
                    child: Container(
                      width: 120.0,
                      height: 125.0,
                      child: Card(
                        child: Center(
                          child: Text(
                            'Tagihan',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => DetailPage()),
                      );
                    },
                  ),
                  GestureDetector(
                    child: Container(
                      width: 120.0,
                      height: 125.0,
                      child: Card(
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center, // Center text vertically
                            children: [
                              Text(
                                '11.11',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                '19 PM',
                                style: TextStyle(
                                  fontSize: 12, // Set the desired smaller font size
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => DetailPage()),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: MyBottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });

          switch (index) {
            case 0:
              // Navigasi ke halaman pertama (Home)
              Navigator.pushNamed(context, '/home');
              break;
            case 1:
              // Navigasi ke halaman detail
              Navigator.pushNamed(context, '/detail');
              break;
            // ... (Tambahkan case sesuai dengan jumlah item di BottomNavigationBar)
          }
        },
      ),
    );
  }
}
