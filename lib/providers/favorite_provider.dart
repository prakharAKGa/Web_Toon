import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webtoon/domain/entities/webtoon_entity.dart';

class FavoriteProvider with ChangeNotifier {
  List<WebtoonEntity> _favorites = [];

  List<WebtoonEntity> get favorites => _favorites;


  bool isFavorite(WebtoonEntity webtoon) {
    return _favorites.any((item) => item.title == webtoon.title);
  }

  void addFavorite(WebtoonEntity webtoon) {
    _favorites.add(webtoon);
    saveFavorites();
    notifyListeners();
  }

  void removeFavorite(WebtoonEntity webtoon) {
    _favorites.removeWhere((item) => item.title == webtoon.title);
    saveFavorites();
    notifyListeners();
  }

  Future<void> loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final savedFavorites = prefs.getStringList('favorites') ?? [];


    _favorites = savedFavorites.map((jsonString) {
      final Map<String, dynamic> jsonMap = json.decode(jsonString);
      return WebtoonEntity(
        title: jsonMap['title'],
        description: jsonMap['description'],
        imageUrl: jsonMap['imageUrl'],
        rating: jsonMap['rating'],
        creator: jsonMap['creator'],
        genre: jsonMap['genre'],
      );
    }).toList();

    notifyListeners();
  }

  Future<void> saveFavorites() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setStringList(
      'favorites',
      _favorites.map((webtoon) => json.encode({
        'title': webtoon.title,
        'description': webtoon.description,
        'imageUrl': webtoon.imageUrl,
        'rating': webtoon.rating,
        'creator': webtoon.creator,
        'genre': webtoon.genre,
      })).toList(),
    );
  }
}
