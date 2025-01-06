
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tinker_bootcamp_app/db/models/wish_list_db.dart';

addWishList(WishList item) async {
  final wishListBox = await Hive.openBox<WishList>('WishList');
  await wishListBox.put(item.id, item);
}

Future<List<WishList>> getWishList() async {
  try {
    final wishListBox = await Hive.openBox<WishList>('WishList');
    return wishListBox.values.toList();
  } catch (e) {
    return [];
  }
}

removeWishList(key) async{
    final wishListBox = await Hive.openBox<WishList>('WishList');
    await wishListBox.delete(key);
}