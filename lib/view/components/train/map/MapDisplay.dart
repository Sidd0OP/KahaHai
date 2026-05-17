import 'dart:ffi';

import 'package:app/data/model/train/PositionModel.dart';
import 'package:app/data/respository/TrainRepo.dart';
import 'package:app/view/AppTheme.dart';
import 'package:app/view/components/train/map/MarkerController.dart';
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

  final MarkerController _markerController = MarkerController();
  final MapController mapController = MapController();

  List<Marker> markers = [];
  double cameraZoom = 5.0;
  int zoomState = 5;


  void displayMarkers() async
  {
    await _markerController.initMarkers();
    setState(() {
      markers = _markerController.zoom_10;
    });
  }

  void getCurrentCameraZoom()
  {
    cameraZoom = mapController.camera.zoom;

  }



  @override
  void initState() {
    super.initState();
    displayMarkers();
  }

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      mapController: mapController,
      options: MapOptions(
        initialCenter: LatLng(28.7041, 77.1025),
        initialZoom: 5,
        onMapEvent: (e) {
          if(e is MapEventMove)
          {
            getCurrentCameraZoom();
          }
        }


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
