import 'package:bloc_ecommerce_app/core/data/models/review_model.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ReviewCard extends StatelessWidget {
  final ReviewModel reviewModel;

  const ReviewCard({
    super.key,
    required this.reviewModel
  });

  @override
  Widget build(BuildContext context) {
    final double rating = reviewModel.rating ?? 0;
    final String formattedDate = reviewModel.createdAt != null
        ? DateFormat('dd MMM yyyy').format(reviewModel.createdAt!)
        : 'Unknown date';
    final bool hasImage = reviewModel.userProfileImage != null &&
        reviewModel.userProfileImage!.isNotEmpty;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 20),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color:  Theme.of(context).brightness == Brightness.dark
                ? Colors.grey.shade900
                : Colors.grey.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
        color: Theme.of(context).brightness == Brightness.dark
            ? Colors.transparent
            : Colors.grey.shade300,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 1,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 22,
                backgroundImage:
                hasImage ? NetworkImage(reviewModel.userProfileImage!) : null,
                child: !hasImage
                    ? const Icon(Icons.person, size: 22)
                    : null,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      reviewModel.userName ?? "Anonymous",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(
                          Icons.access_time,
                          size: 14,
                          color: Colors.grey,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          formattedDate,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Text(
                    rating.toStringAsFixed(1),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: List.generate(
                      5,
                      (index) => Icon(
                        Icons.star,
                        size: 16,
                        color: index < rating.round()
                            ? Colors.orange
                            : Colors.grey.shade300,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 10),
          ExpandableText(
            reviewModel.reviewText ?? "No review provided",
            maxLines: 3,
            expandText: 'Read more',
            collapseText: 'Read less',
            linkColor: Theme.of(context).brightness == Brightness.dark
                ? Colors.white
                : Colors.black,
            textAlign: TextAlign.justify,
            style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.w400,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
