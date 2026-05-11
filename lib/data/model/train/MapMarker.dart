import 'package:latlng/latlng.dart';

class MapMarker {

  final String trainNumber;
  final String trainName;

  final double currentLat;
  final double currentLng;

  final double nextLat;
  final double nextLng;

  MapMarker({
    required this.trainNumber,
    required this.trainName,
    required this.currentLat,
    required this.currentLng,
    required this.nextLat,
    required this.nextLng,
  });
}
