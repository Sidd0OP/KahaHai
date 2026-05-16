import 'dart:ffi';

import 'package:app/data/model/train/PositionModel.dart';
import 'package:app/data/respository/TrainRepo.dart';
import 'package:app/view/AppTheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapDisplay extends StatefulWidget {
  const MapDisplay({super.key});

  @override
  State<MapDisplay> createState() => _MapDisplayState();
}

class _MapDisplayState extends State<MapDisplay> {
  final TrainRepo _repo = TrainRepo();
  late List<Marker> markers = [];
  late final MapController mapController;

  Future<void> loadMarkers() async {
    List<PositionModel> markerModels = await _repo.getAllTrainPositions();

    List<Marker> loadedMarker =  markerModels
        .map(
          (model) => Marker(
            point: LatLng(model.currentLat, model.currentLng),
            child: Container(width: 20,height: 20,color: context.onSurface),
          ),
        )
        .toList();

    // List<Marker> loadedMarker = [];
    //
    // for (int i = 0; i < 10; i++) {
    //   loadedMarker.add(
    //     Marker(
    //       point: LatLng(markerModels[i].currentLat, markerModels[i].currentLng),
    //       child: Container(width: 20, height: 20, color: Colors.white),
    //     ),
    //   );
    // }

    setState(() {
      markers = loadedMarker;
    });
  }

  @override
  void initState() {
    super.initState();
    loadMarkers();
    mapController = MapController();
  }

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      // mapController: mapController,
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
        MarkerLayer(markers: markers),
      ],
    );
  }
}
