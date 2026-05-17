import 'package:flutter/cupertino.dart';

class StationMarker extends StatelessWidget {

  final bool source;
  const StationMarker({super.key, required this.source});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24,
      height: 24,
      child: source ? Image.asset('assets/png/source_station.png') : Image.asset('assets/png/destination_station.png'),
    );
  }
}
