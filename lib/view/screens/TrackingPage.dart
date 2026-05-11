import 'package:app/view/AppTheme.dart';
import 'package:app/view/components/train/container/TrainInfoExpanded.dart';
import 'package:app/view/components/train/map/MapDisplay.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TrackingPage extends StatelessWidget {
  const TrackingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.primary,
      child: SafeArea(
        top: false,
        left: false,
        right: false,
        child: Scaffold(
          backgroundColor: context.primary,
          body: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              MapDisplay(),
              NotificationListener<TrainInfoCloseNotifier>(
                onNotification: (notification){
                  Navigator.pushNamed(context, "/SearchPage");
                  return true;
                },
                  child: TrainInfoExpanded()),

              // Align(
              //   alignment: Alignment.bottomCenter,
              //   child: TrainLarge(),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
