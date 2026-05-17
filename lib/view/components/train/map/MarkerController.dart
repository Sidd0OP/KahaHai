import 'package:app/data/model/train/PositionModel.dart';
import 'package:app/data/model/train/StationMarkerModel.dart';
import 'package:app/data/respository/StationRepo.dart';
import 'package:app/data/respository/TrainRepo.dart';
import 'package:app/view/components/train/map/StationMarker.dart';
import 'package:app/view/components/train/map/TrainMarker.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MarkerController {
  final TrainRepo _repo = TrainRepo();
  final StationRepo _stationRepo = StationRepo();

  List<PositionModel> allTrainPositionData = [];

  List<Marker> zoom_5 = [];
  List<Marker> zoom_10 = [];
  List<Marker> zoom_15 = [];

  // List<Marker> zoomBound = [];
  List<Marker> allMarkers = [];

  Future<void> initMarkers() async {
    allTrainPositionData = await _repo.getAllTrainPositions();

    for (int i = 0; i < allTrainPositionData.length; i++) {
      var model = allTrainPositionData[i];

      allMarkers.add(
        Marker(
          point: LatLng(model.currentLat, model.currentLng),
          child: TrainMarker(),
        ),
      );

      if (i % 10 == 0) {
        zoom_5.add(
          Marker(
            point: LatLng(model.currentLat, model.currentLng),
            child: TrainMarker(),
          ),
        );
        continue;
      }

      if (i % 5 == 0) {
        zoom_10.add(
          Marker(
            point: LatLng(model.currentLat, model.currentLng),
            child: TrainMarker(),
          ),
        );
        continue;
      }

      //idk what im doing
      if (i % 2 == 0 || i % 5 == 0) {
        zoom_15.add(
          Marker(
            point: LatLng(model.currentLat, model.currentLng),
            child: TrainMarker(),
          ),
        );
        continue;
      }
    }
  }

  List<Marker> getSourceDestinationMarkers(
    List<Marker> sourceDestinationMarkers,
    String sourceCode,
    String destinationCode,
  ) {

    StationMarkerModel? sourceMarker = _stationRepo.getStationMarkerFromStationCode(sourceCode);
    StationMarkerModel? destinationMarker = _stationRepo.getStationMarkerFromStationCode(destinationCode);

    if(sourceMarker != null && destinationMarker != null)
    {
      sourceDestinationMarkers.add(
        Marker(
          point: LatLng(sourceMarker.lat, sourceMarker.lng),
          child: StationMarker(source: true),
        ),
      );

      sourceDestinationMarkers.add(
        Marker(
          point: LatLng(destinationMarker.lat, destinationMarker.lng),
          child: StationMarker(source: false),
        ),
      );

      return sourceDestinationMarkers;
    }

    //nice
    return [];

  }
}
