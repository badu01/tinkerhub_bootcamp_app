import 'package:hive/hive.dart';
part 'wish_list_db.g.dart';

@HiveType(typeId: 0)
class WishList {
  
  @HiveField(0)
  String name='';

  @HiveField(1)
  String poster='';

  @HiveField(2)
  double vote;

  @HiveField(3)
  int id;

  WishList({
    required this.name,
    required this.poster,
    required this.vote,
    required this.id
  });
}


