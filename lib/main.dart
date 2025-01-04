import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tinker_bootcamp_app/Core/constants/colors.dart';
import 'package:tinker_bootcamp_app/Screens/App/Page/app_screen.dart';

void main() {
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
        textTheme: GoogleFonts.unboundedTextTheme()
      ),
      home: AppScreen(),
    );
  }
}
