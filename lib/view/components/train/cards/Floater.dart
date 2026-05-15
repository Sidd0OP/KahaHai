import 'package:app/view/AppTheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:smooth_corner/smooth_corner.dart';

class Floater extends StatelessWidget{

  final Widget child;
  final Color color;

  const Floater({
    super.key,
    required this.child,
    required this.color
  });



  @override
  Widget build(BuildContext context) {

    return Container(

      width: double.infinity,
      padding: EdgeInsets.fromLTRB(28, 12, 28, 12),

      decoration: ShapeDecoration(
        color: color,
        shape: SmoothRectangleBorder(
          borderRadius: BorderRadius.circular(42),
          smoothness: 0.8,
        ),
      ),

      child: child,

    );
  }

}