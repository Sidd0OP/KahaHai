import 'dart:convert';
import 'package:http/http.dart' as http;
import 'EndPoints.dart';

class TrainService {
  Future<Map<String, dynamic>> getAllTrainMapData() async {
    var response = await http.get(
      Uri.https(EndPoints.baseUrl, EndPoints.allTrainMaps, {
        'apiKey': EndPoints.apiKey,
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
        EndPoints.baseUrl,
        "${EndPoints.liveTrainTracking}$trainNumber",
        {
          'journeyDate': date,
          'dataType': dataType,
          'dataProvider': "railradar",
          'apiKey': EndPoints.apiKey,
        },
      ),
    );

    if (response.statusCode != 200) {
      //throw an exception
    }

    return jsonDecode(response.body);
  }


}
