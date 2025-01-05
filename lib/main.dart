import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tinker_bootcamp_app/Core/constants/colors.dart';
import 'package:tinker_bootcamp_app/Core/constants/constants.dart';
import 'package:tinker_bootcamp_app/Screens/App/Page/app_screen.dart';
import 'package:tinker_bootcamp_app/db/models/wish_list_db.dart';

void main() async {
  //
  WidgetsFlutterBinding.ensureInitialized();
  //
  //
  await Hive.initFlutter();
  //
  if (!Hive.isAdapterRegistered(WishListAdapter().typeId)) {
    Hive.registerAdapter(WishListAdapter());
  }
  //
  //
  wishListPref = await SharedPreferences.getInstance();
  //

  //------------------------------------------->
  // await wishListPref.clear();
  // final wishListBox = await Hive.openBox('WishList');
  // await wishListBox.clear();
  //------------------------------------------->
  wishListIDs.value = (wishListPref.getStringList('wishListIDs') ?? [])
      .map((value) => int.parse(value))
      .where((id) => id != 0)
      .toList();
  //
  //


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          scaffoldBackgroundColor: MyColors.black,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
          useMaterial3: true,
          textTheme: GoogleFonts.unboundedTextTheme()),
      home: AppScreen(),
    );
  }
}
