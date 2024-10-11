import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:webtoon/domain/entities/webtoon_entity.dart';
import 'package:webtoon/providers/favorite_provider.dart';

class DetailScreen extends StatefulWidget {
  final WebtoonEntity webtoon;

  DetailScreen({super.key, required this.webtoon});

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  double _userRating = 0;

  @override
  Widget build(BuildContext context) {
    final favoriteProvider = Provider.of<FavoriteProvider>(context);
    bool isFavorite = favoriteProvider.isFavorite(widget.webtoon);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          widget.webtoon.title,
          style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite ? Colors.red : Colors.grey,
            ),
            onPressed: () {
              if (isFavorite) {
                favoriteProvider.removeFavorite(widget.webtoon);
                _showSnackBar('Removed from favorites');
              } else {
                favoriteProvider.addFavorite(widget.webtoon);
                _showSnackBar('Added to favorites');
              }
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  widget.webtoon.imageUrl,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 270,
                ),
              ),
              SizedBox(height: 16),
              Text(
                widget.webtoon.title,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                'Genre: ${widget.webtoon.genre}',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[700],
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 5),
              Text(
                'Creator: ${widget.webtoon.creator}',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[700],
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Description: ${widget.webtoon.description}',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Average Rating: ${widget.webtoon.rating.toStringAsFixed(1)}',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Icon(Icons.star, color: Colors.yellow),
                    ],
                  ),
                  Text(
                    'Rate the Anime :',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              SizedBox(
                height: 8,
              ),
              RatingBar.builder(
                initialRating: _userRating,
                minRating: 1,
                maxRating: 5,
                allowHalfRating: false,
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  setState(() {
                    _userRating = rating;
                  });
                  widget.webtoon.updateRating(rating.toInt());
                  _showSnackBar('Thanks for rating!');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showSnackBar(String message) {
    final snackBar = SnackBar(
      content: Text(message),
      duration: Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
