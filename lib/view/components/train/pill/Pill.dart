import 'package:app/view/AppTheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:smooth_corner/smooth_corner.dart';

class Pill extends StatelessWidget {
  final String text;

  final VoidCallback onTapCallback;
  final bool selected;

  const Pill({
    super.key,
    required this.text,
    required this.onTapCallback,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapCallback,
      child: Container(
        height: 48.0,

        // constraints: BoxConstraints(maxWidth: 91),
        // alignment: Alignment.center,
        decoration: ShapeDecoration(
          color: selected ? context.primary : context.onSurface,
          shape: SmoothRectangleBorder(
            borderRadius: BorderRadius.circular(24),
            smoothness: 1,
          ),
        ),

        padding: EdgeInsets.fromLTRB(20, 5, 20, 5),

        child: Center(
          child: Text(
            text,
            style: context.titleMedium?.copyWith(
              color: selected ? context.onSurface : context.primary,
            ),
          ),
        ),
      ),
    );
  }
}
