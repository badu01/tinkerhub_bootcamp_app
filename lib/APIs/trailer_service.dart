import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:tinker_bootcamp_app/Core/constants/api_end_points.dart';
import 'package:tinker_bootcamp_app/Models/trailer_model.dart';

Future<TrailerData> getVideoId(movieID) async {
  try {
    final Response response = await Dio().get(ApiEndPoints.getVID(movieID));
    final jsonData = response.data['results'];
    return TrailerData.fromJson(jsonData[0]);
  } catch (e) {
    log(e.toString());
    return TrailerData(key: 'sad');
  }
}
