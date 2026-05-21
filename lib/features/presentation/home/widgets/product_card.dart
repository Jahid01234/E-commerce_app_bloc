// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:shimmer/shimmer.dart';
//
//
// class ProductCard extends StatelessWidget {
//   final String? productThumbnail;
//   final String productName;
//   final double? productPrice;
//   final void Function()? onItemTap;
//   final void Function()? onItemDoubleTap;
//
//
//   const ProductCard({
//     super.key,
//     required this.productName,
//     this.productThumbnail,
//     this.productPrice,
//     this.onItemTap,
//     this.onItemDoubleTap,
//   });
//
//
//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     return GestureDetector(
//       onTap: onItemTap,
//       onDoubleTap: onItemDoubleTap,
//       child: Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(10),
//           color: theme.colorScheme.surfaceVariant,
//         ),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             AspectRatio(
//               aspectRatio: 1,
//               child: Stack(
//                 children: [
//                   ClipRRect(
//                     borderRadius: const BorderRadius.vertical(
//                       top: Radius.circular(10),
//                     ),
//                     child: CachedNetworkImage(
//                       imageUrl: productThumbnail ?? "",
//                       fit: BoxFit.cover,
//                       width: double.infinity,
//                       height: double.infinity,
//                       placeholder: (context, url) => Shimmer.fromColors(
//                         baseColor: Colors.grey.shade300,
//                         highlightColor: Colors.grey.shade100,
//                         child: Container(color: Colors.white),
//                       ),
//                       errorWidget: (context, url, error) => Container(
//                         color: Colors.grey.shade100,
//                         child: const Icon(Icons.image_not_supported, size: 40),
//                       ),
//                     ),
//                   ),
//                   Positioned(
//                     top: 5,
//                     right: 5,
//                     child: Container(
//                       padding: const EdgeInsets.all(4),
//                       decoration: BoxDecoration(
//                         color: Colors.white.withValues(alpha: 0.9),
//                         shape: BoxShape.circle,
//                       ),
//                       child: const Icon(
//                         Icons.favorite_border,
//                         size: 18,
//                         color: Colors.red,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.0),
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // title
//                   Text(
//                     productName,
//                     maxLines: 2,
//                     overflow: TextOverflow.ellipsis,
//                     style: theme.textTheme.labelLarge
//                         ?.copyWith(fontWeight: FontWeight.w600,
//                     ),
//                   ),
//
//                   // price
//                   Text(
//                     productPrice == 0.0
//                         ? 'Free'
//                         : '\$${productPrice?.toStringAsFixed(0) ?? ''}',
//                     style: theme.textTheme.titleMedium
//                         ?.copyWith(fontWeight: FontWeight.w600,
//                     ),
//                   )
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
//

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ProductCard extends StatelessWidget {
  final String? productThumbnail;
  final String productName;
  final double? productPrice;
  final void Function()? onItemTap;
  final void Function()? onItemDoubleTap;
  final bool isFavourite;           // নতুন
  final void Function()? onFavouriteTap;  // নতুন

  const ProductCard({
    super.key,
    required this.productName,
    this.productThumbnail,
    this.productPrice,
    this.onItemTap,
    this.onItemDoubleTap,
    this.isFavourite = false,       // নতুন
    this.onFavouriteTap,            // নতুন
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: onItemTap,
      onDoubleTap: onItemDoubleTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: theme.colorScheme.surfaceVariant,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(10),
                    ),
                    child: CachedNetworkImage(
                      imageUrl: productThumbnail ?? "",
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                      placeholder: (context, url) => Shimmer.fromColors(
                        baseColor: Colors.grey.shade300,
                        highlightColor: Colors.grey.shade100,
                        child: Container(color: Colors.white),
                      ),
                      errorWidget: (context, url, error) => Container(
                        color: Colors.grey.shade100,
                        child: const Icon(Icons.image_not_supported, size: 40),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 5,
                    right: 5,
                    child: GestureDetector(        // নতুন
                      onTap: onFavouriteTap,       // নতুন
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.9),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          // filled হলে favourite, border হলে unfavourite
                          isFavourite ? Icons.favorite : Icons.favorite_border,
                          size: 18,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productName,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.labelLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    productPrice == 0.0
                        ? 'Free'
                        : '\$${productPrice?.toStringAsFixed(0) ?? ''}',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
