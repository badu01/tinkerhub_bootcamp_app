import 'package:flutter/material.dart';
import 'package:tinker_bootcamp_app/Core/constants/colors.dart';
import 'package:tinker_bootcamp_app/Screens/Trailer/Pages/trailer_screen.dart';
import 'package:tinker_bootcamp_app/db/functions/wishlist_fn.dart';
import 'package:tinker_bootcamp_app/db/models/wish_list_db.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Your Wish list',
          style: TextStyle(color: MyColors.white),
        ),
      ),
      body: FutureBuilder<List<WishList>>(
        future: getWishList(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          } else if (snapshot.hasData) {
            final wishList = snapshot.data!;
            return ListView.builder(
              shrinkWrap: true,
              itemCount: wishList.length,
              itemBuilder: (context, index) {
                return wishList.isEmpty
                    ? Center(
                        child: Text('no book mark'),
                      )
                    : ListTile(
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
    );
  }
}
