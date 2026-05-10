import 'dart:ffi';

import 'package:app/view/AppTheme.dart';
import 'package:app/view/components/train/cards/Timing.dart';
import 'package:app/view/components/train/cards/Name.dart';
import 'package:app/view/components/train/container/TimeLine.dart';
import 'package:app/view/components/train/container/TrainSmall.dart';
import 'package:app/view/components/train/pill/Heading.dart';
import 'package:app/view/components/train/pill/SourceDestination.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TrainLarge extends StatelessWidget {
  const TrainLarge({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(0, 20, 0, 0),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(60),
          topRight: Radius.circular(60),
        ),
      ),

      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,

        spacing: 14,

        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              // side widgets
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 42),
                    child: Text(
                      "+ 20m",
                      style: context.titleMedium,
                    ),
                  ),

                  Spacer(),

                  IconButton(
                    padding: EdgeInsets.only(right: 20),
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      'assets/svg/cross.svg',
                    ),
                  ),
                ],
              ),

              // absolute center
              Heading(),
            ],
          ),

          //time line
          SizedBox(
            height: 240,
            child: ListView(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(horizontal: 16),
              children: [Center(child: TimeLine())],
            ),
          ),
          Padding(
            padding: EdgeInsetsGeometry.fromLTRB(16, 0, 16, 0),
            child: TrainSmall(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 14,
                children: [
                  Text("Bhopal Shatabdi", style: context.headlineLarge),
                  // SourceDestination(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
