class HomeData {
  final int id;
  final String title;
  final String posterPath;
  final String description;

  HomeData(
      {required this.id,
      required this.title,
      required this.posterPath,
      required this.description});

  factory HomeData.fromJson(Map<String, dynamic> json) => HomeData(
      id: json['id'],
      title: json['title'],
      posterPath: json['poster_path'],
      description: json['overview']);
}
