import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ReviewShimmerCard extends StatelessWidget {
  const ReviewShimmerCard({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 20),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isDark ? Colors.grey.shade900 : Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isDark ? Colors.transparent : Colors.grey.shade300,
        ),
      ),
      child: Shimmer.fromColors(
        baseColor: isDark ? Colors.grey.shade800 : Colors.grey.shade300,
        highlightColor: isDark ? Colors.grey.shade700 : Colors.grey.shade100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// 🔹 Top Row
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Avatar shimmer
                Container(
                  width: 44,
                  height: 44,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                ),

                const SizedBox(width: 10),

                /// Name + Date
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// Name
                      Container(
                        width: 120,
                        height: 14,
                        color: Colors.white,
                      ),

                      const SizedBox(height: 6),

                      /// Date
                      Container(
                        width: 80,
                        height: 12,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),

                /// Rating
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      width: 30,
                      height: 14,
                      color: Colors.white,
                    ),
                    const SizedBox(height: 6),

                    Row(
                      children: List.generate(
                        5,
                            (index) => Container(
                          width: 14,
                          height: 14,
                          margin: const EdgeInsets.symmetric(horizontal: 1),
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 12),

            /// 🔹 Review text shimmer
            Column(
              children: List.generate(
                3, (index) => Container(
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  width: double.infinity,
                  height: 12,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}