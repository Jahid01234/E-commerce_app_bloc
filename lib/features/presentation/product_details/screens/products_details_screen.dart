import 'package:bloc_ecommerce_app/core/utils/images_path.dart';
import 'package:bloc_ecommerce_app/features/blocs/product/single_product_bloc.dart';
import 'package:bloc_ecommerce_app/features/blocs/product/single_product_state.dart';
import 'package:bloc_ecommerce_app/features/presentation/product_details/widgets/build_product_image_gallery.dart';
import 'package:bloc_ecommerce_app/features/presentation/product_details/widgets/build_product_variant_gallery.dart';
import 'package:bloc_ecommerce_app/features/presentation/product_details/widgets/product_details_shimmer_card.dart';
import 'package:bloc_ecommerce_app/features/presentation/product_details/widgets/top_action_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class ProductsDetailsScreen extends StatelessWidget {
  const ProductsDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    //final layout = MediaQuery.of(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: BlocBuilder<SingleProductBloc,SingleProductState>(
            builder: (context, state) {
              if (state is SingleProductLoading) {
                return ProductDetailsShimmerCard();
              }

              if(state is SingleProductFetchSuccess) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AspectRatio(
                      aspectRatio: 3 / 3,
                      child: Stack(
                        children: [
                          CachedNetworkImage(
                            imageUrl: state.product.imageGallery.first.url ?? ImagesPath.thumbnailImg,
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: double.infinity,
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
                                      Icons.image_not_supported, size: 40),
                                ),
                          ),
                          TopActionBar(
                            onBackTap: () => Navigator.pop(context),
                            onCartTap: () {
                              // cart action
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 6),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            state.product.productName ?? "Unknown",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: theme.textTheme.labelLarge
                                ?.copyWith(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),

                          // price
                          Text(
                            state.product.productPrice == 0.0
                                ? 'Free'
                                : '\$${state.product.productPrice?.toStringAsFixed(0) ?? ''}',
                            style: theme.textTheme.titleMedium
                                ?.copyWith(fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 30),
                    BuildProductImageGallery(imageGallery: state.product.imageGallery),
                    SizedBox(height: 10),
                    BuildProductVariantGallery(variant: state.product.variant),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "Description",
                        style: theme.textTheme.labelLarge
                            ?.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(height: 4),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child:  ExpandableText(
                        state.product.productDetails ?? "No more details",
                        maxLines: 3,
                        expandText: 'Read more',
                        collapseText: 'Read less',
                        linkColor: Colors.black,
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                );
              }

              if(state is SingleProductFetchFailed){
                return Center(child: Text(state.message));
              }

              return const SizedBox();
            }
          ),
        ),
      ),
    );
  }
}

