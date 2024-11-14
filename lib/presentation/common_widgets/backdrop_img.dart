import 'dart:ui';
import 'package:finance_house_task/utils/assets_links.dart';
import 'package:flutter/material.dart';

import '../../utils/util_methods.dart';

class BackdropImg extends StatelessWidget {
  final String? backdropPath;
  final Widget child;

  const BackdropImg({Key? key, required this.backdropPath, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Image in the background
        ImageCacheCustom(
          url: UtilMethods.imgUrl(backdropPath ?? AssetsLinks.placeholderUri),
          // Ensure the image covers the entire screen
          width: UtilMethods.mediaSize(context).width,
          // Make the image full-width
          height: UtilMethods.mediaSize(context)
              .height, // Make the image full-height
        ),

        // Glass effect on top of the image
        Positioned.fill(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0), // Apply blur
            child: Container(
              color: Colors.white
                  .withOpacity(0.3), // Add a semi-transparent overlay
            ),
          ),
        ),

        // Your content goes here, for example a column with movie details
        child
      ],
    );
  }
}
