import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:prak_1/component/BottomNavigationBar.dart';

void main() {
  runApp(MaterialApp(
    home: NewsScreen(),
  ));
}

class NewsScreen extends StatefulWidget {
  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  late Future<List<News>> newsList;
  int _currentIndex = 2;

  @override
  void initState() {
    super.initState();
    newsList = fetchNews();
  }

  Future<List<News>> fetchNews() async {
    try {
      final response =
          await http.get(Uri.parse('https://jakpost.vercel.app/api/category/life/food'));

      if (response.statusCode == 200) {
        final dynamic data = json.decode(response.body);

        if (data['status'] == 200) {
          final List<dynamic> posts = data['posts'];
          final Map<String, dynamic> featuredPost = data['featured_post'];

          List<News> newsList = [];

          // Parsing data post
          News featuredNews = News.fromJson(featuredPost);
          newsList.add(featuredNews);

          // Parsing jika ada posts lain
          newsList.addAll(List<News>.from(posts.map((item) => News.fromJson(item))));

          return newsList;
        } else {
          throw Exception('API request unsuccessful');
        }
      } else {
        throw Exception('Failed to load news. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
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
      body: FutureBuilder<List<News>>(
        future: newsList,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No news available.'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(bottom: 10.0),
                  child: buildNewsCard(snapshot.data![index]),
                );
              },
            );
          }
        },
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

  Widget buildNewsCard(News news) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Column(
        children: [
          Image.network(
            news.image,
            height: 150.0,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  news.title,
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8.0),
                Text(news.headline),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class News {
  final String link;
  final String title;
  final String image;
  final String headline;
  final String category;
  final String imageDesc;
  final String publishedAt;

  News({
    required this.link,
    required this.title,
    required this.image,
    required this.headline,
    required this.category,
    required this.imageDesc,
    required this.publishedAt,
  });

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      link: json['link'] ?? '',
      title: json['title'] ?? '',
      image: json['image'] ?? '',
      headline: json['headline'] ?? '',
      category: json['category'] ?? '',
      imageDesc: json['image_desc'] ?? '',
      publishedAt: json['pusblised_at'] ?? '',
    );
  }
}
