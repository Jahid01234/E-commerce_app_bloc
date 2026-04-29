import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ProductDetailsShimmerCard extends StatelessWidget {
  const ProductDetailsShimmerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// 🔹 1. Product Image
            shimmerBox(height: 250, radius: 12),
            const SizedBox(height: 16),
            /// 🔹 2. Name + Price
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                shimmerBox(width: 180, height: 20),
                shimmerBox(width: 80, height: 20),
              ],
            ),
            const SizedBox(height: 16),
            /// 🔹 3. Horizontal Image List
            SizedBox(
              height: 70,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                separatorBuilder: (_, __) => const SizedBox(width: 10),
                itemBuilder: (_, __) =>
                    shimmerBox(width: 70, height: 70, radius: 10),
              ),
            ),
            const SizedBox(height: 16),
            /// 🔹 4. Size List
            SizedBox(
              height: 40,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: 6,
                separatorBuilder: (_, __) => const SizedBox(width: 10),
                itemBuilder: (_, __) =>
                    shimmerBox(width: 50, height: 40, radius: 20),
              ),
            ),
            const SizedBox(height: 20),
            /// 🔹 5. Description
            shimmerBox(height: 16, width: double.infinity),
            const SizedBox(height: 8),
            shimmerBox(height: 16, width: double.infinity),
            const SizedBox(height: 8),
            shimmerBox(height: 16, width: 200),
            const SizedBox(height: 20),
            /// 🔹 6. Reviews
            shimmerBox(height: 20, width: 120),
            const SizedBox(height: 10),
            Column(
              children: List.generate(
                3, (index) => Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: shimmerBox(height: 60),
                ),
              ),
            ),
          ],
        ),
    );
  }

  // shimmer box..............
  Widget shimmerBox({
    double height = 20,
    double width = double.infinity,
    double radius = 8,
  }) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
    );
  }
}
