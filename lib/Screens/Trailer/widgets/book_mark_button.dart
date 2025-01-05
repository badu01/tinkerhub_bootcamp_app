
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tinker_bootcamp_app/Core/constants/constants.dart';
import 'package:tinker_bootcamp_app/Models/details_model.dart';
import 'package:tinker_bootcamp_app/db/functions/wishlist_fn.dart';
import 'package:tinker_bootcamp_app/db/models/wish_list_db.dart';

import '../../../Core/constants/colors.dart';

class BookMarkButton extends StatefulWidget {
  const BookMarkButton({super.key, required this.data, required this.callBack});
  final DetailsData data;
  final void Function(String) callBack;
  @override
  State<BookMarkButton> createState() => _BookMarkButtonState();
}

class _BookMarkButtonState extends State<BookMarkButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        //
        //
        WishList wishList = WishList(
          name: widget.data.title,
          poster: widget.data.posterPath,
          vote: widget.data.vote,
          id: widget.data.id,
        );
        //
        //
        await addWishList(wishList);
        //
        //
        wishListIDs.value = [...wishListIDs.value, widget.data.id];
        //
        //
        wishListPref = await SharedPreferences.getInstance();
        //
        wishListPref.setStringList('wishListIDs',
            wishListIDs.value.map((value) => value.toString()).toList());
        //
        //
        setState(() {
          widget.data.toggleSelect();
        });
        //
        //
        widget.data.isBookMarked!
            ? widget.callBack('Added to book marked')
            : widget.callBack('removed from book marked');
      },
      icon: Icon(Icons.bookmark_rounded),
      color:
          wishListIDs.value.contains(widget.data.id) ? MyColors.white : MyColors.black,
      style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(
              wishListIDs.value.contains(widget.data.id)
                  ? MyColors.purple
                  : MyColors.white)),
    );
  }
}
