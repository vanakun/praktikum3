import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prak_1/component/BottomNavigationBar.dart';
import 'package:prak_1/pages/detail.dart';
import 'package:prak_1/pages/profile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        // Set preferred orientations
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
          DeviceOrientation.portraitDown,
        ]);

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
          body: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildImageAndText(),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildCard('11.11', '19 PM', () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => DetailPage()),
                        );
                      }),
                      _buildCard('Gratis', 'Ongkir', () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => DetailPage()),
                        );
                      }),
                      _buildCard('Flash', 'Sale', () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => DetailPage()),
                        );
                      }),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildCard('Murah', 'Lebay', () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => DetailPage()),
                        );
                      }),
                      _buildCard('Tagihan', '', () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => DetailPage()),
                        );
                      }),
                      _buildCard('11.11', '19 PM', () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => DetailPage()),
                        );
                      }),
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
                  Navigator.pushNamed(context, '/home');
                  break;
                case 1:
                  Navigator.pushNamed(context, '/detail');
                  break;
                case 2:
                  Navigator.pushNamed(context, '/profile');
                  break;
              }
            },
          ),
        );
      },
    );
  }

  Widget _buildCard(String title, String subtitle, VoidCallback onTap) {
    return GestureDetector(
      child: Container(
        width: 120.0,
        height: 125.0,
        child: Card(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
      onTap: onTap,
    );
  }

  Widget _buildImageAndText() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProfileScreen()),
        );
      },
      child: Row(
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
    );
  }
}
