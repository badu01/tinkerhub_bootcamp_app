import 'package:dio/dio.dart';
import 'package:tinker_bootcamp_app/Core/constants/api_end_points.dart';
import 'package:tinker_bootcamp_app/Models/search_model.dart';

Future<List<SearchData>> getSeacrh(movieQuery) async{

        try {
          final Response response = await Dio().get(ApiEndPoints.search,queryParameters: {'query':movieQuery});

          if(response.statusCode == 200 || response.statusCode == 201){
            final jsonData = response.data['results'] as List;

            return jsonData.map((json)=>SearchData.fromJson(json)).toList();
          }else{
            throw Exception('Fail to fetch data');
          }
        } catch (e) {
          return[];
        }
}