class StationModel {

  int sequence;
  String stationCode;
  String stationName;
  int isHalt;
  String scheduledArrival;
  String scheduledDeparture;
  String actualArrival = " ";
  String actualDeparture = " ";
  int platform;
  int day;
  double distanceFromSourceKm;
  int delayDeparture = 0;

  StationModel({
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
  factory StationModel.fromJson(Map<String, dynamic> json)
  {
    return StationModel(
      sequence: (json["sequence"] as num?)?.toInt() ?? 0,

      stationCode: json["stationCode"] ?? "",
      stationName: json["stationName"] ?? "",
      isHalt: (json["isHalt"] as num?)?.toInt() ?? 0,

      scheduledArrival: json["scheduledArrival"] != null
          ? minuteToHourTime((json["scheduledArrival"] as num).toInt())
          : " ",

      scheduledDeparture: json["scheduledDeparture"] != null
          ? minuteToHourTime((json["scheduledDeparture"] as num).toInt())
          : " ",

      platform: int.tryParse(json["platform"]?.toString() ?? "") ?? 0,
      day: (json["day"] as num?)?.toInt() ?? 0,
      distanceFromSourceKm: (json["distanceFromSourceKm"] as num?)?.toDouble() ?? 0.0,
    );
  }


  static String minuteToHourTime(int totalMinutes)
  {

    int hours = (totalMinutes ~/ 60) % 24;
    int minutes = totalMinutes % 60;

    String period = hours >= 12 ? "PM" : "AM";

    hours = hours % 12;
    if (hours == 0) {
      hours = 12;
    }

    return "$hours:${minutes.toString().padLeft(2, '0')} $period";
  }


  static String unixToHourTime(int unixTime)
  {
    DateTime dateTime =
    DateTime.fromMillisecondsSinceEpoch(unixTime * 1000);

    int hours = dateTime.hour;
    int minutes = dateTime.minute;

    String period = hours >= 12 ? "PM" : "AM";

    hours = hours % 12;
    if (hours == 0) {
      hours = 12;
    }

    return "$hours:${minutes.toString().padLeft(2, '0')} $period";
  }


  void updateLiveStationInfo(Map<String, dynamic> liveRoute)
  {
    scheduledArrival = liveRoute["scheduledArrival"] != null ?
    unixToHourTime((liveRoute["scheduledArrival"] as num).toInt()) : scheduledArrival;

    scheduledDeparture = liveRoute["scheduledDeparture"] != null ?
    unixToHourTime((liveRoute["scheduledDeparture"] as num).toInt()) : scheduledDeparture;

    actualArrival = liveRoute["actualArrival"] != null ?
    unixToHourTime((liveRoute["actualArrival"] as num).toInt()) : actualArrival;

    actualDeparture = liveRoute["actualDeparture"] != null ?
    unixToHourTime((liveRoute["actualDeparture"] as num).toInt()) : actualDeparture;

    delayDeparture = liveRoute["delayDepartureMinutes"]?.toInt() ?? 0;
  }


}
