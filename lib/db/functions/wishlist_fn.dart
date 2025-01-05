
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tinker_bootcamp_app/db/models/wish_list_db.dart';

Future<bool> addWishList(WishList item) async {
  final wishListBox = await Hive.openBox<WishList>('WishList');
  await wishListBox.add(item);
  return true;
}

Future<List<WishList>> getWishList() async {
  try {
    final wishListBox = await Hive.openBox<WishList>('WishList');
    return wishListBox.values.toList();
  } catch (e) {
    return [];
  }
}
