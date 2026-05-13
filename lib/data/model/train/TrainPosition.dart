import 'dart:math';

import 'package:latlng/latlng.dart';

class TrainPosition {
  final String trainNumber;
  final String trainName;

  final double currentLat;
  final double currentLng;

  final double nextLat;
  final double nextLng;

  final double angle;

  TrainPosition({
    required this.trainNumber,
    required this.trainName,
    required this.currentLat,
    required this.currentLng,
    required this.nextLat,
    required this.nextLng,
    required this.angle,
  });

  factory TrainPosition.fromJson(Map<String, dynamic> json) {

    double currentLat = (json["current_lat"] as num).toDouble();
    double currentLng = (json["current_lng"] as num).toDouble();

    double nextLat = (json["next_lat"] as num).toDouble();
    double nextLng = (json["next_lng"] as num).toDouble();

    double angle = calculateBearing(currentLat, currentLng, nextLat, nextLng);

    return TrainPosition(
      trainNumber: json["train_number"] as String,
      trainName: json["train_name"] as String,
      currentLat: currentLat,
      currentLng: currentLng,
      nextLat: nextLat,
      nextLng: nextLng,
      angle: angle,
    );
  }

  static double calculateBearing(
    double startLat,
    double startLng,

    double endLat,
    double endLng,
  ) {
    double startLatRad = startLat * pi / 180;

    double startLngRad = startLng * pi / 180;

    double endLatRad = endLat * pi / 180;

    double endLngRad = endLng * pi / 180;

    double dLng = endLngRad - startLngRad;

    double y = sin(dLng) * cos(endLatRad);

    double x =
        cos(startLatRad) * sin(endLatRad) -
        sin(startLatRad) * cos(endLatRad) * cos(dLng);

    double bearing = atan2(y, x);

    bearing = bearing * 180 / pi;

    return (bearing + 360) % 360;
  }
}
