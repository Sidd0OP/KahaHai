import 'dart:ffi';

import 'package:app/data/model/train/PositionModel.dart';
import 'package:app/data/model/train/TrainModel.dart';
import 'package:app/data/respository/TrainRepo.dart';
import 'package:app/view/AppTheme.dart';
import 'package:app/view/components/train/map/MarkerController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapDisplay extends StatefulWidget {
  final TrainModel train;

  const MapDisplay({super.key, required this.train});

  @override
  State<MapDisplay> createState() => _MapDisplayState();
}

class _MapDisplayState extends State<MapDisplay> {
  final MarkerController markerController = MarkerController();
  final MapController mapController = MapController();

  List<Marker> markers = [];
  List<Marker> sourceDestinationMarkers = [];

  double cameraZoom = 5.0;
  int zoomState = 0;

  void displayMarkers() async {
    await markerController.initMarkers();
    setState(() {
      markers = markerController.zoom_5;

      sourceDestinationMarkers = markerController.getSourceDestinationMarkers(
        sourceDestinationMarkers,
        widget.train.sourceStationCode,
        widget.train.destinationStationCode,
      );
    });
  }

  void updateMarkerFromZoom() {
    cameraZoom = mapController.camera.zoom;
    int currentZoomState = zoomState;

    if (cameraZoom <= 5.0) {
      zoomState = 0;
    }

    if (cameraZoom > 5.0 && cameraZoom <= 7.0) {
      zoomState = 0;
    }

    if (cameraZoom > 7.0 && cameraZoom <= 8.5) {
      zoomState = 1;
    }

    if (cameraZoom > 8.5 && cameraZoom <= 9.0) {
      zoomState = 2;
    }

    if (cameraZoom > 10.0) {
      zoomState = 3;
    }

    if (currentZoomState != zoomState) {
      print("Changed zoom state to $zoomState");

      currentZoomState = zoomState;
      setState(() {
        switch (zoomState) {
          case 0:
            markers = markerController.zoom_5;
            break;

          case 1:
            markers = markerController.zoom_10;
            break;

          case 2:
            markers = markerController.zoom_15;
            break;

          case 3:
            markers = markerController.allMarkers;
            break;
        }
      });
    }
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
        initialZoom: 6,
        minZoom: 5,
        maxZoom: 14,
        onMapEvent: (e) {
          if (e is MapEventMove) updateMarkerFromZoom();
        },
      ),
      children: [
        TileLayer(
          urlTemplate:
              'https://api.maptiler.com/maps/outdoor-v4/{z}/{x}/{y}@2x.png?key=9X1VrMpeoWjXrgOaaChQ',
          userAgentPackageName: 'com.kahahai.app',
        ),
        MarkerLayer(markers: markers),
        MarkerLayer(markers: sourceDestinationMarkers),
      ],
    );
  }
}
