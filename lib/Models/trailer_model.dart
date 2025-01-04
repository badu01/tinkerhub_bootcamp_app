class TrailerData{
  final key;
  
  TrailerData({
    required this.key,
  });

  factory TrailerData.fromJson(Map<String, dynamic> json)=>TrailerData(key: json['key']);
}