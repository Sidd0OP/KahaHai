import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Dot.dart';

class ThreeDots extends StatelessWidget{

  const ThreeDots({super.key});

  @override
  Widget build(BuildContext context) {

    return Container(
        // height: double.infinity,
        // color: Colors.red,
        // height: 40,
        // alignment: Alignment.center,
        // padding: EdgeInsets.fromLTRB(0, 3, 0, 0),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Transform.translate(
                offset: Offset(0, -17),
                child: Row(
                  spacing: 5,
                  children: [Dot(),Dot(),Dot()],
                )
            )
          ],
        ),
    );
  }

}