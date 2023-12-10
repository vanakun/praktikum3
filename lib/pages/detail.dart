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
          color: Color.fromARGB(255, 227, 224, 224),
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
              '\$2',
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

  Widget _buildFavoriteTextAndIconend() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
          Padding(
            padding: const EdgeInsets.only(left: 19.5),
            child: Text(
              '\$2',
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
      
    );
  }

  Widget _buildLimitedStockTextAndIcon(String stockMessage) {
  return GestureDetector(
    child: Container(
      width: 120.0,
      height: 200.0,
      child: Card(
        color: Color.fromARGB(255, 227, 224, 224),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          children: [
            
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.asset(
                'assets/product1.jpeg',
                width: 110.0,
                height: 110.0,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'STOCK TERBATAS',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w800,
                  color: Color.fromARGB(255, 255, 132, 45),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
    onTap: () {
      _showMyDialog(context);
    },
  );
}
Widget _buildCardWithImage(String imagePath) {
  return GestureDetector(
    child: SingleChildScrollView(
      child: Card(
        color: Color.fromARGB(255, 227, 224, 224),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.asset(
                imagePath,
                width: 110.0,
                height: 110.0,
                fit: BoxFit.cover,
              ),
            ),
          ],
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
              Column(
                children: [
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildCardWithImage('assets/product.jpg'),
                      _buildCardWithImage('assets/product1.jpeg'),
                      _buildCardWithImage('assets/product2.jpg'),
                    ],
                  ),
                ],
              ),
              _buildFavoriteTextAndIcon(),
              SizedBox(height: 50),
              Column(
                children: [
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildCardWithImage('assets/product3.jpeg'),
                      _buildCardWithImage('assets/product5.jpg'),
                      _buildCardWithImage('assets/product6.jpg'),
                    ],
                  ),
                ],
              ),
              _buildFavoriteTextAndIcon(),
              SizedBox(height: 50),
               Column(
                children: [
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildCardWithImage('assets/product2.jpg'),
                      _buildCardWithImage('assets/product1.jpeg'),
                      _buildCardWithImage('assets/product4.jpg'),
                    ],
                  ),
                ],
              ),
              _buildFavoriteTextAndIcon(),
              SizedBox(height: 50),
               Column(
                children: [
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      _buildCardWithImage('assets/product.jpg'),
                     
                    ],
                  ),
                ],
              ),
              _buildFavoriteTextAndIconend(),
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
              Navigator.pushNamed(context, '/news');
              break;  
            case 3:
              Navigator.pushNamed(context, '/profile');
              break;
          }
        },
      ),
    );
  }
}