import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../utils/app_colors.dart';

class AppShimmerContainer extends StatelessWidget {
  final double height;
  final double width;
  final double borderRadius;
  final BoxShape shape;

  const AppShimmerContainer({
    super.key,
    required this.height,
    required this.width,
    this.borderRadius = 0,
    this.shape = BoxShape.rectangle,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.darkPrimary.withValues(alpha: 0.2),
      highlightColor: AppColors.darkPrimary.withValues(alpha: 0.05),
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: shape,
          borderRadius: shape == BoxShape.rectangle
              ? BorderRadius.circular(borderRadius)
              : null,
        ),
      ),
    );
  }
}
