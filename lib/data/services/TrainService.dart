import 'dart:convert';
import 'package:http/http.dart' as http;
import 'ApiEndPoints.dart';

class TrainService {
  Future<Map<String, dynamic>> getAllTrainMapData() async {
    var response = await http.get(
      Uri.https(ApiEndPoints.baseUrl, ApiEndPoints.allTrainMaps, {
        'apiKey': ApiEndPoints.apiKey,
      }),
    );

    if (response.statusCode != 200) {
      //throw an exception
    }

    return jsonDecode(response.body);
  }

  Future<Map<String, dynamic>> getTrainData(
      //dataType => live / static / full
    String dataType,
    String trainNumber,
    String date,

  ) async {
    var response = await http.get(
      Uri.https(
        ApiEndPoints.baseUrl,
        "${ApiEndPoints.liveTrainTracking}$trainNumber",
        {
          'journeyDate': date,
          'dataType': dataType,
          'dataProvider': "railradar",
          'apiKey': ApiEndPoints.apiKey,
        },
      ),
    );

    if (response.statusCode != 200) {
      //throw an exception
    }

    return jsonDecode(response.body);
  }


}
