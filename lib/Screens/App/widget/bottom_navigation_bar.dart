import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tinker_bootcamp_app/Core/constants/colors.dart';
import 'package:tinker_bootcamp_app/Core/constants/constants.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: indexChangeNotifier,
        builder: (context, int newIndex, _) {
          return BottomNavigationBar(
            backgroundColor: MyColors.black,
            iconSize: 18,
            unselectedFontSize: 10,
            selectedFontSize: 13,
            currentIndex: newIndex,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: MyColors.purple,
            unselectedItemColor: MyColors.grey,
            onTap: (index) {
              indexChangeNotifier.value = index;
            },
            items: [
              BottomNavigationBarItem(
                  icon: FaIcon(FontAwesomeIcons.house), label: 'Home'),
              BottomNavigationBarItem(
                  icon: FaIcon(FontAwesomeIcons.magnifyingGlass),
                  label: 'Search'),
              BottomNavigationBarItem(
                  icon: Stack(
                    alignment: AlignmentDirectional.topCenter,
                    children: [
                      FaIcon(FontAwesomeIcons.bookmark),
                      ValueListenableBuilder(
                        valueListenable: wishListIDs,
                        builder: (ctx, count, _) {
                          return Text(
                            count.length.toString(),
                            style:
                                TextStyle(fontSize: 8, color: MyColors.white),
                          );
                        },
                      ),
                    ],
                  ),
                  label: 'Wish List')
            ],
          );
        });
  }
}
