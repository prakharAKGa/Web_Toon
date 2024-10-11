import 'package:webtoon/domain/entities/webtoon_entity.dart';

class WebtoonModel extends WebtoonEntity {
  WebtoonModel({
    required String title,
    required String description,
    required String imageUrl,
    required double rating,
    required String creator,
    required String genre,
    List<int> ratings = const [], 
  }) : super(
          title: title,
          description: description,
          imageUrl: imageUrl,
          rating: rating,
          creator: creator,
          genre: genre,
          ratings: ratings, 
        );

  factory WebtoonModel.fromJson(Map<String, dynamic> json) {
    return WebtoonModel(
      title: json['title'],
      description: json['description'],
      imageUrl: json['imageUrl'],
      rating: (json['rating'] as num).toDouble(),
      creator: json['creator'],
      genre: json['genre'],
      ratings: List<int>.from(json['ratings'] ?? []),  
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'imageUrl': imageUrl,
      'rating': rating,
      'creator': creator,
      'genre': genre,
      'ratings': ratings,  
    };
  }
}
