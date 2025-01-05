import 'package:flutter/material.dart';
import 'package:tinker_bootcamp_app/Core/constants/constants.dart';
import 'package:tinker_bootcamp_app/Screens/App/widget/bottom_navigation_bar.dart';
import 'package:tinker_bootcamp_app/Screens/Home/page/home_screen.dart';
import 'package:tinker_bootcamp_app/Screens/Search/Page/search_screen.dart';
import 'package:tinker_bootcamp_app/Screens/WishList/page/wish_list.dart';

class AppScreen extends StatelessWidget {
  const AppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _screen = [
      HomeScreen(),
      SearchScreen(),
      WishListScreen(),
    ];
    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: indexChangeNotifier,
          builder: (context, index, _) => _screen[index],
        ),
      ),
      bottomNavigationBar: BottomNavigationBarWidget(),
    );
  }
}
