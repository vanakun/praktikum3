import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}


class _DetailPageState extends State<DetailPage> {
  Future<void> _showMyDialog(context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'SESI 9',
          style: TextStyle(
            color: const Color.fromARGB(255, 255, 255, 255), // Set text color to purple
            fontWeight: FontWeight.bold, // Set font weight to bold
            fontSize: 32.0, // Set font size to 22
          ),
        ),
        backgroundColor: Colors.red, // Set the background color to red
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        child: Container(
                          width: 100.0,
                          height: 150.0,
                          child: Card(child: Text('stock terbatas')),
                          
                        ),
                        onTap: () {
                          _showMyDialog(context);
                        },
                      ),
                      GestureDetector(
                        child: Container(
                          width: 100.0,
                          height: 150.0,
                          child: Card(child: Text('stock terbatas')),
                        ),
                        onTap: () {
                          _showMyDialog(context);
                        },
                      ),
                      GestureDetector(
                        child: Container(
                          width: 100.0,
                          height: 150.0,
                          child: Card(child: Text('stock terbatas')),
                        ),
                        onTap: () {
                          _showMyDialog(context);
                        },
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(width: 10),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      SizedBox(width: 10),
                      Text(
                        "Flash Sale",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        child: Container(
                          width: 100.0,
                          height: 150.0,
                          child: Card(child: Text('stock terbatas')),
                        ),
                        onTap: () {
                          _showMyDialog(context);
                        },
                      ),
                      GestureDetector(
                        child: Container(
                          width: 100.0,
                          height: 150.0,
                          child: Card(child: Text('stock terbatas')),
                        ),
                        onTap: () {
                          _showMyDialog(context);
                        },
                      ),
                      GestureDetector(
                        child: Container(
                          width: 100.0,
                          height: 150.0,
                          child: Card(child: Text('stock terbatas')),
                        ),
                        onTap: () {
                          _showMyDialog(context);
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        child: Container(
                          width: 100.0,
                          height: 150.0,
                          child: Card(child: Text('stock terbatas')),
                        ),
                        onTap: () {
                          _showMyDialog(context);
                        },
                      ),
                      GestureDetector(
                        child: Container(
                          width: 100.0,
                          height: 150.0,
                          child: Card(child: Text('stock terbatas')),
                        ),
                        onTap: () {
                          _showMyDialog(context);
                        },
                      ),
                      GestureDetector(
                        child: Container(
                          width: 100.0,
                          height: 150.0,
                          child: Card(child: Text('stock terbatas')),
                        ),
                        onTap: () {
                          _showMyDialog(context);
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
