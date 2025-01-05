import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

final kHeight_10 = SizedBox(height: 10 );
final kWidth_10 = SizedBox(width: 10 );

final kHeight_5 = SizedBox(height: 5 );
final kWidth_5 = SizedBox(width: 5 );

ValueNotifier<int> indexChangeNotifier = ValueNotifier(0);
ValueNotifier<List<int>> wishListIDs = ValueNotifier([]);

late SharedPreferences wishListPref;