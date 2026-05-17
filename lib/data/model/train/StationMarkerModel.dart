class StationMarkerModel {
  String stationName;
  String stationCode;

  double lat;
  double lng;

  StationMarkerModel({
    required this.stationName,
    required this.stationCode,
    required this.lat,
    required this.lng,
  });

  factory StationMarkerModel.fromJson(Map<String, dynamic> json) {
    return StationMarkerModel(
      stationName: json["stationName"],
      stationCode: json["stationCode"],
      lat: double.parse(json["lat"]) ,
      lng: double.parse(json["lng"]),
    );
  }
}
