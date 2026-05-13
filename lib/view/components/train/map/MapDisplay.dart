import 'dart:ffi';

import 'package:app/data/model/train/TrainPosition.dart';
import 'package:app/data/respository/TrainRepo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapDisplay extends StatefulWidget {
  const MapDisplay({super.key});

  @override
  State<MapDisplay> createState() => _MapDisplayState();
}

class _MapDisplayState extends State<MapDisplay> {

  final TrainRepo _repo = TrainRepo();
  late  List<Marker> markers = [];

  Future<void> loadMarkers() async {
    List<TrainPosition> markerModels = await _repo.getAllTrainPositions();

    List<Marker> loadedMarker =  markerModels
        .map(
          (model) => Marker(
            point: LatLng(model.currentLat, model.currentLng),
            child: FlutterLogo(),
          ),
        )
        .toList();

    // setState(() {
    //   markers = loadedMarker;
    // });

  }

  @override
  void initState() {
    super.initState();
    loadMarkers();
  }

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      mapController: MapController(),
      options: MapOptions(
        initialCenter: LatLng(28.7041, 77.1025),
        initialZoom: 5,
      ),
      children: [
        TileLayer(
          urlTemplate:
              'https://api.maptiler.com/maps/outdoor-v4/{z}/{x}/{y}@2x.png?key=9X1VrMpeoWjXrgOaaChQ',
          userAgentPackageName: 'com.kahahai.app',
        ),
        MarkerLayer(markers: markers)
      ],
    );
  }
}
