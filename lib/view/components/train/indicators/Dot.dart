import 'package:app/view/AppTheme.dart';
import 'package:flutter/cupertino.dart';


class Dot extends StatelessWidget{

  const Dot({super.key});

  @override
  Widget build(BuildContext context) {
   return Container(
     width: 8,
     height: 8,
     decoration: BoxDecoration(
       color: context.primary,
       borderRadius: BorderRadius.circular(4),
     ),

   );
  }
}

