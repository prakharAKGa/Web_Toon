class WebtoonEntity {
  final String title;
  final String description;
  final String imageUrl;
  double rating; 
  final String creator;
  final String genre;
  List<int> ratings; 

  WebtoonEntity({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.rating,
    required this.creator,
    required this.genre,
    this.ratings = const [], 
  }) {
   
    ratings = []; 
  }

 
  void updateRating(int newRating) {
    ratings.add(newRating); 
    rating = ratings.reduce((a, b) => a + b) / ratings.length; 
  }
}
