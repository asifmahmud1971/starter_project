import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class PatientInfoShimmer extends StatelessWidget {
  const PatientInfoShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Shimmer(
        // This is the ONLY required parameter
        duration: const Duration(seconds: 3),
        // This is NOT the default value. Default value: Duration(seconds: 0)
        interval: const Duration(seconds: 5),
        // This is the default value
        color: Colors.white,
        // This is the default value
        colorOpacity: 0.3,
        // This is the default value
        enabled: true,
        // This is the default value
        direction: const ShimmerDirection.fromLTRB(),
        // This is the ONLY required parameter
        child: Container(
          color: Colors.deepPurple,
        ),
      ),
    );
  }
}
