import 'package:app/view/AppTheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:smooth_corner/smooth_corner.dart';

class TrainSmall extends StatelessWidget{

  final Widget child;

  const TrainSmall({
    super.key,
    required this.child
  });



  @override
  Widget build(BuildContext context) {

    return Container(

      width: double.infinity,
      height: 120,
      
      padding: EdgeInsets.fromLTRB(32, 12, 32, 12),

      decoration: ShapeDecoration(
        color: context.tertiary,
        shape: SmoothRectangleBorder(
          borderRadius: BorderRadius.circular(40),
          smoothness: 0.6,
        ),
      ),

      child: child,

    );
  }

}