import 'package:flutter/cupertino.dart';

class TrainMarker extends StatelessWidget {
  const TrainMarker({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24,
      height: 24,
      child: Image.asset('assets/png/train_marker.png'),
    );
  }
}
