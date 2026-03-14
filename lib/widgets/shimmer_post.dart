import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerPost extends StatelessWidget {
  const ShimmerPost({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),

          Row(
            children: [
              const SizedBox(width: 10),

              const CircleAvatar(radius: 20),

              const SizedBox(width: 10),

              Container(width: 120, height: 12, color: Colors.white),
            ],
          ),

          const SizedBox(height: 10),

          Container(height: 300, width: double.infinity, color: Colors.white),

          const SizedBox(height: 10),

          Row(
            children: [
              const SizedBox(width: 10),

              Container(width: 30, height: 30, color: Colors.white),

              const SizedBox(width: 10),

              Container(width: 30, height: 30, color: Colors.white),
            ],
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
