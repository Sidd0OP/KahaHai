import 'package:flutter/cupertino.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapDisplay extends StatelessWidget{

  const MapDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(

      child: FlutterMap(
        mapController: MapController(

        ),
        options: MapOptions(
          initialCenter: LatLng(28.7041, 77.1025)
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://api.maptiler.com/maps/outdoor-v4/{z}/{x}/{y}@2x.png?key=9X1VrMpeoWjXrgOaaChQ',
            userAgentPackageName: 'com.kahahai.app',
          ),
          // MarkerLayer(markers: )
        ],
      ),

    );
  }
}