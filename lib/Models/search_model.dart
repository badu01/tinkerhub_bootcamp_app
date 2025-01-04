class SearchData {
  final int id;
  final String title;
  final String releaseDate;
  final double vote;

  SearchData({
    required this.id,
    required this.title,
    required this.releaseDate,
    required this.vote,
  });

  factory SearchData.fromJson(Map<String, dynamic> json) => SearchData(
        id: json['id'],
        title: json['title'],
        releaseDate: json['release_date'],
        vote: json['vote_average'],
      );
}
