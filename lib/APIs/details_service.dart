import 'package:dio/dio.dart';
import 'package:tinker_bootcamp_app/Core/constants/api_end_points.dart';
import 'package:tinker_bootcamp_app/Models/details_model.dart';

Future<DetailsData> getDetails(movieID)async {
  try {
    final Response response = await Dio().get(ApiEndPoints.getDetailsURL(movieID));
    final jsonData = response.data;
    return DetailsData.fromJson(jsonData);
  } catch (e) {
    return DetailsData(title: '', description: '',geners: [], releaseDate: '', vote: 0,posterPath: '',id: 0);
  }
}