import 'package:flutter/material.dart';
import 'package:prak_1/component/BottomNavigationBar.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  Future<void> _showMyDialog(context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Barang Terjual Habis',
            style: TextStyle(fontSize: 15),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Batal'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Ya'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  int _currentIndex = 1;

  Widget _buildCard() {
    return GestureDetector(
      child: Container(
        width: 120.0,
        height: 120.0,
        child: Card(
          color: Color.fromARGB(255, 227, 224, 224), // Set the color to gray
        ),
      ),
      onTap: () {
        _showMyDialog(context);
      },
    );
  }

  Widget _buildFavoriteTextAndIcon() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        for (int i = 0; i < 3; i++) ...[
          Padding(
            padding: const EdgeInsets.only(left: 19.5),
            child: Text(
              '\$1',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 60.0),
            child: Icon(
              Icons.favorite,
              color: Colors.red,
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildLimitedStockTextAndIcon(String stockMessage) {
    return GestureDetector(
      child: Container(
        width: 120.0,
        height: 170.0,
        child: Card(
          child: OverflowBox(
            maxWidth: double.infinity,
            child: Align(
              alignment: FractionalOffset.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  stockMessage,
                  style: TextStyle(color: Colors.orange),
                ),
              ),
            ),
          ),
        ),
      ),
      onTap: () {
        _showMyDialog(context);
      },
    );
  }

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
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildLimitedStockTextAndIcon('stock\nterbatas'),
                  _buildLimitedStockTextAndIcon('stock\nterbatas'),
                  _buildLimitedStockTextAndIcon('stock\nterbatas'),
                ],
              ),
              _buildFavoriteTextAndIcon(),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 20.0),
                    child: Text(
                      "FLASH SALE",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  for (int i = 0; i < 3; i++) _buildCard(),
                ],
              ),
              _buildFavoriteTextAndIcon(),
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  for (int i = 0; i < 3; i++) _buildCard(),
                ],
              ),
              _buildFavoriteTextAndIcon(),
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
          }
        },
      ),
    );
  }
}