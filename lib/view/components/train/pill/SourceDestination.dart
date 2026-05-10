import 'package:app/view/AppTheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_corner/smooth_corner.dart';

class SourceDestination extends StatelessWidget {
  const SourceDestination({super.key});

  Widget _textBlock(BuildContext context, Color leftColor , Color rightColor) {
    return Padding(
      padding: EdgeInsetsGeometry.fromLTRB(20, 2, 20, 0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "New Delhi",
                style: context.titleLarge?.copyWith(color: leftColor),
              ),
              Text(
                "29 Nov, 11:59pm",
                style: context.labelMedium?.copyWith(color: leftColor),
              ),
            ],
          ),

          Column(
            children: [
              Text(
                "Rani Kamlapati",
                style: context.titleLarge?.copyWith(color: rightColor),
              ),
              Text(
                "29 Nov, 11:59pm",
                style: context.labelMedium?.copyWith(color: rightColor),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double width = constraints.maxWidth;
        double height = constraints.maxHeight;

        return ClipRRect(
          
          borderRadius: BorderRadiusGeometry.circular(23),
          
          child: Stack(
            children: [
              //black part
              Container(
                height: 48,
                width: width,
                color: context.onSurface,

              ),

              //white container
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  height: 48,
                  width: width * 0.5,
                  color: context.primary,
                  // child: _textBlock(context, context.onSurface),
                ),
              ),

              //white text, background text
              _textBlock(context, context.onSurface , context.primary),
              // _textBlock(context, context.onSurface)

              // ClipRect(
              //   child: Align(
              //     alignment: Alignment.centerLeft,
              //     // widthFactor: 0.8,
              //     //   child: _textBlock(context, context.onSurface)
              //     child: SizedBox(
              //       width: width * (1 - 0.5),
              //       child: OverflowBox(
              //         alignment: Alignment.centerRight,
              //         minWidth: width,
              //         maxWidth: width,
              //         child: _textBlock(context, context.onSurface),
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        );
      },
    );
  }
}
