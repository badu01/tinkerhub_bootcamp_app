

class DetailsData {
  final int id;
  final String title;
  final String description;
  final String releaseDate;
  final String posterPath;
  final List<Map<String,dynamic>> geners;
  final double vote;
  bool? isBookMarked;

  DetailsData(
      {required this.id,
      required this.title,
      required this.description,
      required this.geners,
      required this.releaseDate,
      required this.vote,
      required this.posterPath
      });

  factory DetailsData.fromJson(Map<String, dynamic> json) => DetailsData(
        id: json['id'],
        title: json['title'],
        description: json['overview'],
        geners: List<Map<String,dynamic>>.from(json['genres']),
        releaseDate: json['release_date'],
        vote: json['vote_average'],
        posterPath: json['poster_path'],
      );

  void toggleSelect(){
    final toggle = isBookMarked ?? false;
    isBookMarked = !toggle;
  }
}
