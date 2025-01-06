import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:tinker_bootcamp_app/Core/constants/colors.dart';
import 'package:tinker_bootcamp_app/Core/constants/constants.dart';
import 'package:tinker_bootcamp_app/Screens/Trailer/Pages/trailer_screen.dart';
import 'package:tinker_bootcamp_app/db/functions/wishlist_fn.dart';
import 'package:tinker_bootcamp_app/db/models/wish_list_db.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.black,
        surfaceTintColor: MyColors.black,
        title: Text(
          'Your Wish list',
          style: TextStyle(color: MyColors.white),
        ),
      ),
      body: ValueListenableBuilder(
        valueListenable: wishListIDs,
        builder: (ctx, list, _) => FutureBuilder<List<WishList>>(
          future: getWishList(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Center(
                child: Text(
                  snapshot.error.toString(),
                ),
              );
            } else if (!snapshot.hasData) {
              return Center(
                child: Text(
                  'no book mark',
                  style: TextStyle(color: MyColors.white),
                ),
              );
            } else if (snapshot.hasData) {
              final wishList = snapshot.data!;
              return wishList.isEmpty
                  ? Center(
                      child: Text(
                        'no book mark',
                        style: TextStyle(color: MyColors.white),
                      ),
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      itemCount: wishList.length,
                      itemBuilder: (context, index) {
                        log(wishList.length.toString());
                        return ListTile(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (ctx) =>
                                    TrailerScreen(id: wishList[index].id),
                              ),
                            );
                          },
                          textColor: MyColors.white,
                          title: Text(wishList[index].name),
                        );
                      },
                    );
            } else {
              return Center(
                child: Text('no data'),
              );
            }
          },
        ),
      ),
    );
  }
}
