

class DetailsData {
  final String title;
  final String description;
  final String releaseDate;
  final List<Map<String,dynamic>> geners;
  final double vote;

  DetailsData(
      {required this.title,
      required this.description,
      required this.geners,
      required this.releaseDate,
      required this.vote});

  factory DetailsData.fromJson(Map<String, dynamic> json) => DetailsData(
        title: json['title'],
        description: json['overview'],
        geners: List<Map<String,dynamic>>.from(json['genres']),
        releaseDate: json['release_date'],
        vote: json['vote_average'],
      );
}
