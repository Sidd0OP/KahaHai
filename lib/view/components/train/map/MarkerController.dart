import 'package:app/data/model/train/PositionModel.dart';
import 'package:app/data/respository/TrainRepo.dart';
import 'package:app/view/components/train/map/TrainMarker.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MarkerController {
  final TrainRepo _repo = TrainRepo();

  List<PositionModel> allTrainPositionData = [];

  List<Marker> zoom_5 = [];
  List<Marker> zoom_10 = [];
  List<Marker> zoom_15 = [];

  // List<Marker> zoomBound = [];
  List<Marker> allMarkers = [];

  Future<void> initMarkers() async {
    allTrainPositionData = await _repo.getAllTrainPositions();

    for (int i = 0; i < allTrainPositionData.length; i++)
    {
      var model = allTrainPositionData[i];

      if (i % 10 == 0)
      {
        zoom_5.add(
          Marker(
            point: LatLng(model.currentLat, model.currentLng),
            child: TrainMarker(),
          ),
        );
        continue;
      }

      if (i % 5 == 0)
      {
        zoom_10.add(
          Marker(
            point: LatLng(model.currentLat, model.currentLng),
            child: TrainMarker(),
          ),
        );
        continue;
      }

      //idk what im doing
      if (i % 5 == 0 && i % 3 == 0)
      {
        zoom_10.add(
          Marker(
            point: LatLng(model.currentLat, model.currentLng),
            child: TrainMarker(),
          ),
        );
        continue;
      }

      allMarkers.add(
        Marker(
          point: LatLng(model.currentLat, model.currentLng),
          child: TrainMarker(),
        ),
      );

    }
  }
}
