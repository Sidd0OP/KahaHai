import 'package:app/view/components/train/pill/Info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widget_previews.dart';
import 'package:smooth_corner/smooth_corner.dart';

class Name extends StatelessWidget{

  const Name({super.key});

  @override
  Widget build(BuildContext context) {


    final color = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      height: 64,
      width: 160,

      decoration: ShapeDecoration(
        color: color.secondary,
        shape: SmoothRectangleBorder(
          borderRadius: BorderRadius.circular(18),
          smoothness: 1,
        ),
      ),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text("Station", style: textTheme.titleLarge,),
          const Info()
        ],
      ),

    );
  }

}



@Preview()
Widget previewStationName() {
  return const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      body: Center(
        child: Name(),
      ),
    ),
  );
}
