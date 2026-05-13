class Train {

  //static details
  String trainNumber;
  String trainName;
  String sourceStationCode;
  String sourceStationName;
  String destinationStationCode;
  String destinationStationName;
  String returnTrainNumber;
  int travelTimeMinutes;
  int totalHalts;
  double distanceKm;

  //live details
  String? journeyDate;
  double? currentDistanceKm;
  double? currentLat;
  double? currentLng;


  Train({
    required this.trainNumber,
    required this.trainName,
    required this.sourceStationCode,
    required this.sourceStationName,
    required this.destinationStationCode,
    required this.destinationStationName,
    required this.returnTrainNumber,
    required this.travelTimeMinutes,
    required this.totalHalts,
    required this.distanceKm,
  });

  factory Train.fromJson(Map<String, dynamic> json) {
    return Train(

      trainNumber: json["trainNumber"] ?? "",
      trainName: json["trainName"] ?? "",
      sourceStationCode: json["sourceStationCode"] ?? "",
      sourceStationName: json["sourceStationName"] ?? "",
      destinationStationCode: json["destinationStationCode"] ?? "",
      destinationStationName: json["destinationStationName"] ?? "",
      returnTrainNumber: json["returnTrainNumber"] ?? "",
      travelTimeMinutes: json["travelTimeMinutes"] ?? 0,
      totalHalts: json["totalHalts"] ?? 0,
      distanceKm: (json["distanceKm"] ?? 0).toDouble(),
    );
  }


  void updateLiveDetails(Map<String , dynamic> liveData , Map<String , dynamic> liveLocation)
  {
    journeyDate = liveData["journeyDate"];

    currentLat = liveLocation["latitude"]?.toDouble();
    currentLng = liveLocation["longitude"]?.toDouble();
    currentDistanceKm = liveData["distanceFromOriginKm"]?.toDouble();
  }
}
