class Station {
  int sequence;
  String stationCode;
  String stationName;
  int isHalt;
  int scheduledArrival;
  int scheduledDeparture;
  String platform;
  int day;
  double distanceFromSourceKm;

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

  factory Station.fromJson(Map<String, dynamic> json) {
    return Station(
      sequence:
      (json["sequence"] as num?)
          ?.toInt() ?? 0,

      stationCode:
      json["stationCode"] ?? "",

      stationName:
      json["stationName"] ?? "",

      isHalt:
      (json["isHalt"] as num?)
          ?.toInt() ?? 0,

      scheduledArrival:
      (json["scheduledArrival"]
      as num?)
          ?.toInt() ?? 0,

      scheduledDeparture:
      (json["scheduledDeparture"]
      as num?)
          ?.toInt() ?? 0,

      platform:
      json["platform"] ?? "",

      day:
      (json["day"] as num?)
          ?.toInt() ?? 0,

      distanceFromSourceKm:
      (json["distanceFromSourceKm"]
      as num?)
          ?.toDouble() ?? 0.0,
    );
  }
}
