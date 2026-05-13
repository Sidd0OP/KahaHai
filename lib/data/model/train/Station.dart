class Station {

  int sequence;
  String stationCode;
  String stationName;
  int isHalt;
  String scheduledArrival;
  String scheduledDeparture;
  String? actualArrival;
  String? actualDeparture;
  String platform;
  int day;
  double distanceFromSourceKm;
  double? delayDeparture;

  Station({
    required this.sequence,
    required this.stationCode,
    required this.stationName,
    required this.isHalt,
    required this.scheduledArrival,
    required this.scheduledDeparture,
    required this.platform,
    required this.day,
    required this.distanceFromSourceKm,
  });


  //static data
  factory Station.fromJson(Map<String, dynamic> json)
  {
    return Station(
      sequence: (json["sequence"] as num?)?.toInt() ?? 0,
      stationCode: json["stationCode"] ?? "",
      stationName: json["stationName"] ?? "",
      isHalt: (json["isHalt"] as num?)?.toInt() ?? 0,
      scheduledArrival: json["scheduledArrival"]?.toString() ?? "-",
      scheduledDeparture: json["scheduledDeparture"]?.toString() ?? "-",
      platform: json["platform"] ?? "",
      day: (json["day"] as num?)?.toInt() ?? 0,
      distanceFromSourceKm: (json["distanceFromSourceKm"] as num?)?.toDouble() ?? 0.0,
    );
  }


  void updateLiveStationInfo(Map<String, dynamic> liveRoute)
  {
    scheduledArrival = liveRoute["scheduledArrival"] != null ? DateTime.fromMicrosecondsSinceEpoch(liveRoute["scheduledArrival"] as int).toString() : " ";
    scheduledDeparture = liveRoute["scheduledDeparture"] != null ? DateTime.fromMicrosecondsSinceEpoch(liveRoute["scheduledDeparture"] as int).toString() : " ";

    actualArrival = liveRoute["actualArrival"] != null ? DateTime.fromMicrosecondsSinceEpoch(liveRoute["actualArrival"] as int).toString() : " ";
    actualDeparture = liveRoute["actualDeparture"] != null ? DateTime.fromMicrosecondsSinceEpoch(liveRoute["actualDeparture"] as int).toString() : " ";

    delayDeparture = liveRoute["delayDepartureMinutes"]?.toDouble() ?? 0.0;
  }


}
