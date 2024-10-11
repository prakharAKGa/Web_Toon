import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webtoon/data/model/webtoon_model.dart';
import 'package:webtoon/screens/favorites_screen.dart';

import '../providers/webtoon_provider.dart';
import 'detail_screen.dart'; // Import the detail screen

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<WebtoonProvider>(context, listen: false);
      provider.loadWebtoons();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F4F8),
      appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            'Webtoon Explorer',
            style: TextStyle(
                fontSize: 24, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FavoritesScreen(),
                      ));
                },
                icon: Icon(Icons.favorite_outlined)),
          ]),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Top 10 Popular Webtoons with Over 50 million Views",
              style: TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Consumer<WebtoonProvider>(
              builder: (context, provider, child) {
                if (provider.isLoading) {
                  return Center(child: CircularProgressIndicator());
                }

                if (provider.webtoons.isEmpty) {
                  return Center(child: Text('No Webtoons Found'));
                }

                return ListView.builder(
                  itemCount: provider.webtoons.length,
                  itemBuilder: (context, index) {
                    final webtoon = provider.webtoons[index];

                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                DetailScreen(webtoon: webtoon as WebtoonModel),
                          ),
                        );
                      },
                      child: Card(
                        color: const Color(0xFFFFF9E6),
                        margin: EdgeInsets.all(18),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        elevation: 12,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(12),
                              ),
                              child: Image.asset(
                                webtoon.imageUrl,
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: 200,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    webtoon.title,
                                    style: TextStyle(
                                      color: const Color(0xFF2C3E50),
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    'Genre: ${webtoon.genre}',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: const Color(0xFF6C757D),
                                        fontWeight: FontWeight.w700),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    'Author: ${webtoon.creator}',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: const Color(0xFF6C757D),
                                        fontWeight: FontWeight.w700),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
