import 'package:flutter/material.dart';
import 'package:prak_1/pages/detail.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                  Text(
                    'Live Now\n11.11 Sale',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
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
                              child: Center( // Center the Text widget
                                child: Text(
                                      '11.11\n19 PM',
                                style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                ),
                              textAlign: TextAlign.center, // Center-align the text
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
                              child: Center( // Center the Text widget
                                child: Text(
                                      'Gratis\nOngkir',
                                style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                ),
                              textAlign: TextAlign.center, // Center-align the text
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
                              child: Center( // Center the Text widget
                                child: Text(
                                      'Flash\nSale',
                                style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                ),
                              textAlign: TextAlign.center, // Center-align the text
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
                              child: Center( // Center the Text widget
                                child: Text(
                                      'Murah\nLebay',
                                style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                ),
                              textAlign: TextAlign.center, // Center-align the text
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
                              child: Center( // Center the Text widget
                                child: Text(
                                      'Tagihan',
                                style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                ),
                              textAlign: TextAlign.center, // Center-align the text
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
                              child: Center( // Center the Text widget
                                child: Text(
                                      '11.11\n19 PM',
                                style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                ),
                              textAlign: TextAlign.center, // Center-align the text
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
    );
  }
}