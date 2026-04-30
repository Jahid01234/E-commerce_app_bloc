import 'package:bloc_ecommerce_app/core/data/models/product_model.dart';
import 'package:bloc_ecommerce_app/core/utils/images_path.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class BuildProductImageGallery extends StatelessWidget {
  final List<ImageGallery>? imageGallery;
  final int selectedIndex;
  final Function(int) onTapImage;

  const BuildProductImageGallery({
    super.key,
    required this.imageGallery,
    required this.selectedIndex,
    required this.onTapImage,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: SizedBox(
        height: 100,
        child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemCount: imageGallery?.length ?? 0,
          scrollDirection: Axis.horizontal,
          separatorBuilder: (_, __) => const SizedBox(width: 10),
          itemBuilder: (context, index) {
            final image = imageGallery?[index];

            return GestureDetector(
              onTap: () => onTapImage(index), // 👈 IMPORTANT

              child: AspectRatio(
                aspectRatio: 1,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),

                    // 👇 selected হলে highlight
                    border: Border.all(
                      color: selectedIndex == index
                          ? Colors.blue
                          : Colors.transparent,
                      width: 2,
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: CachedNetworkImage(
                      imageUrl:
                      image?.url ?? ImagesPath.thumbnailImg,
                      fit: BoxFit.cover,
                      placeholder: (context, url) =>
                          Shimmer.fromColors(
                            baseColor: Colors.grey.shade300,
                            highlightColor: Colors.grey.shade100,
                            child: Container(color: Colors.white),
                          ),
                      errorWidget: (context, url, error) =>
                          Container(
                            color: Colors.grey.shade100,
                            child: const Icon(
                              Icons.image_not_supported,
                              size: 20,
                            ),
                          ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}