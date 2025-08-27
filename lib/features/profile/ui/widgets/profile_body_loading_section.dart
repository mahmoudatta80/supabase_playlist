import 'package:flutter/material.dart';

import '../../../../core/widgets/app_shimmer_container.dart';

class ProfileBodyLoadingSection extends StatelessWidget {
  const ProfileBodyLoadingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(height: 80),
        AppShimmerContainer(height: 140, width: 140, shape: BoxShape.circle),
        SizedBox(height: 20),
        AppShimmerContainer(
          height: 50,
          width: double.infinity,
          borderRadius: 14,
        ),
        SizedBox(height: 20),
        AppShimmerContainer(
          height: 50,
          width: double.infinity,
          borderRadius: 14,
        ),
        SizedBox(height: 30),
        AppShimmerContainer(
          height: 50,
          width: double.infinity,
          borderRadius: 30,
        ),
        SizedBox(height: 20),
        AppShimmerContainer(
          height: 50,
          width: double.infinity,
          borderRadius: 30,
        ),
      ],
    );
  }
}
