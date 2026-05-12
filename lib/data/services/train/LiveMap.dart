import 'dart:convert';
import 'package:http/http.dart' as http;
import '../EndPoints.dart';

class LiveMap {
  Future<Map<String , dynamic>> getAllTrainMapData() async {
    var response = await http.get(
      Uri.https(EndPoints.baseUrl , EndPoints.allTrainMaps, {'apiKey': EndPoints.apiKey}),
    );

    if(response.statusCode != 200)
    {
      //throw an exception
    }

    return jsonDecode(response.body);
  }
}
