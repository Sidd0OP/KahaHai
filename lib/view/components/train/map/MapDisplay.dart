import 'package:app/data/respository/train/TrainRepo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapDisplay extends StatefulWidget{

  const MapDisplay({super.key});

  @override
  State<MapDisplay> createState() => _MapDisplayState();
}


class _MapDisplayState extends State<MapDisplay>{

  final TrainRepo _repo = TrainRepo();

  @override
  void initState(){
    super.initState();
    var data = _repo.getAllTrainMapData();

    data.asStream().forEach((train) {

      print(train.values);

    });
    print("Map Display initialised");
  }

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
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
    );
  }


}