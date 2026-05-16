import 'package:app/view/AppTheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smooth_corner/smooth_corner.dart';

class SearchResult extends StatelessWidget {
  const SearchResult({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(16, 4, 16, 4),
      height: 92,
      decoration: ShapeDecoration(
        color: context.secondary,
        shape: SmoothRectangleBorder(
          borderRadius: BorderRadius.circular(28),
          smoothness: 0.8,
        ),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 10,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 14),
            child: Text(
              "New Delhi Bhopal Shatabdi Express",
              style: context.titleMedium?.copyWith(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ),

          Container(
            height: 36,
            padding: EdgeInsets.fromLTRB(16, 3, 4, 3),
            decoration: ShapeDecoration(
              color: context.tertiary,
              shape: SmoothRectangleBorder(
                borderRadius: BorderRadius.circular(18),
                smoothness: 0.8,
              ),
            ),

            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  spacing: 16,
                  children: [
                    Text("NDLS", style: context.titleMedium),
                    Opacity(
                      opacity: 0.5,
                      child: SvgPicture.asset(
                        "assets/svg/dashed_arrow.svg",
                        height: 10,
                      ),
                    ),
                    Text("RKMP", style: context.titleMedium),
                  ],
                ),

                Container(
                  height: 28,
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  // padding: EdgeInsets.fromLTRB(16, 2, 16, 2),
                  decoration: ShapeDecoration(
                    color: context.primary,
                    shape: SmoothRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                      smoothness: 0.8,
                    ),
                  ),
                  child: Text("12001", style: context.titleMedium),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
