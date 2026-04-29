import 'package:bloc_ecommerce_app/core/data/models/product_model.dart';
import 'package:bloc_ecommerce_app/core/utils/images_path.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class BuildProductImageGallery extends StatelessWidget {
  final List<ImageGallery>? imageGallery;

  const BuildProductImageGallery({
    super.key,
    required this.imageGallery,
  });



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: SizedBox(
        height: 100,
        child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemCount: imageGallery?.length ?? 0 ,
          scrollDirection: Axis.horizontal,
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(width: 10);
          },
          itemBuilder: (context, index) {
            return AspectRatio(
              aspectRatio: 3 / 3,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CachedNetworkImage(
                  imageUrl: imageGallery?[index].url ?? ImagesPath.thumbnailImg ,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                    child: Container(color: Colors.white),
                  ),
                  errorWidget: (context, url, error) => Container(
                    color: Colors.grey.shade100,
                    child: const Icon(Icons.image_not_supported, size: 20),
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
