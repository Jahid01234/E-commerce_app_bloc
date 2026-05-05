import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ReviewShimmerCard extends StatelessWidget {
  const ReviewShimmerCard({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: size.height * 0.07),

            // Title
            Container(
              height: 16,
              width: 200,
              color: Colors.white,
            ),
            SizedBox(height: size.height * 0.015),

            // TextField box
            Container(
              height: 120,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            SizedBox(height: size.height * 0.025),

            // Rating title
            Container(
              height: 16,
              width: 120,
              color: Colors.white,
            ),
            SizedBox(height: size.height * 0.015),

            // Stars fake row
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                5,(index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Container(
                    height: 28,
                    width: 28,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: size.height * 0.08),

            // Button
            Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ],
        ),
      ),
    );
  }
}