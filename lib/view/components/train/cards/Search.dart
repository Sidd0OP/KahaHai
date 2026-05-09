import 'package:app/view/AppTheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_corner/smooth_corner.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42,
      width: double.infinity,
      alignment: Alignment.center,

      padding: EdgeInsets.fromLTRB(20, 0, 6, 0),

      decoration: ShapeDecoration(
        color: context.primary,
        shape: SmoothRectangleBorder(
          borderRadius: BorderRadius.circular(22),
          smoothness: 0.6,
        ),
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                isDense: true,
                hintText: "Enter Train Name/No",
                hintStyle: context.labelMedium?.copyWith(
                  color: context.onSurface.withValues(alpha: 0.5),
                ),
                border: InputBorder.none,
              ),
            ),
          ),

          //date selector
          Container(

            width: 100,
            height: 36,

            alignment: Alignment.center,

            decoration: ShapeDecoration(
              color: context.secondary,
              shape: SmoothRectangleBorder(
                borderRadius: BorderRadius.circular(22),
                smoothness: 0.6,
              ),
            ),


            child: Text("Date"),
          ),
        ],
      ),
    );
  }
}
