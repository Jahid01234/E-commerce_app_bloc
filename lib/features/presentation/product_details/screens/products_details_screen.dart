import 'package:bloc_ecommerce_app/core/global_widgets/app_primary_button.dart';
import 'package:bloc_ecommerce_app/core/routes/routes.dart';
import 'package:bloc_ecommerce_app/core/utils/images_path.dart';
import 'package:bloc_ecommerce_app/features/blocs/product/single_product_bloc.dart';
import 'package:bloc_ecommerce_app/features/blocs/product/single_product_event.dart';
import 'package:bloc_ecommerce_app/features/blocs/product/single_product_state.dart';
import 'package:bloc_ecommerce_app/features/presentation/product_details/widgets/build_product_image_gallery.dart';
import 'package:bloc_ecommerce_app/features/presentation/product_details/widgets/build_product_variant_gallery.dart';
import 'package:bloc_ecommerce_app/features/presentation/product_details/widgets/product_details_shimmer_card.dart';
import 'package:bloc_ecommerce_app/features/presentation/product_details/widgets/review_card.dart';
import 'package:bloc_ecommerce_app/features/presentation/product_details/widgets/top_action_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';

class ProductsDetailsScreen extends StatelessWidget {
  ProductsDetailsScreen({super.key});
  final List<Map<String, dynamic>> reviews = [
    {
      "name": "Ronald Richards",
      "date": "13 Sep, 2020",
      "rating": 4.8,
      "review": "Lorem ipsum dolor sit amet...",
      "image": "https://i.pravatar.cc/150?img=1",
    },
    {
      "name": "John Doe",
      "date": "15 Sep, 2020",
      "rating": 4.5,
      "review": "Very good product!",
      "image": "https://i.pravatar.cc/150?img=2",
    },
    {
      "name": "Alex Smith",
      "date": "20 Sep, 2020",
      "rating": 5.0,
      "review": "Excellent quality! Highly recommended.Excellent quality!",
      "image": "https://i.pravatar.cc/150?img=3",
    },
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: BlocBuilder<SingleProductBloc, SingleProductState>(
            builder: (context, state) {
              if (state is SingleProductLoading) {
                return ProductDetailsShimmerCard();
              }

              if (state is SingleProductFetchSuccess) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AspectRatio(
                      aspectRatio: 3 / 3,
                      child: Stack(
                        children: [
                          CachedNetworkImage(
                            imageUrl:
                                state
                                    .product
                                    .imageGallery[state.selectedImageIndex]
                                    .url ??
                                ImagesPath.thumbnailImg,
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
                              child: const Icon(
                                Icons.image_not_supported,
                                size: 40,
                              ),
                            ),
                          ),
                          TopActionBar(
                            onBackTap: () => context.goNamed(Routes.bottomNavBar),
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
                            style: theme.textTheme.labelLarge?.copyWith(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),

                          // price
                          Text(
                            state.product.productPrice == 0.0
                                ? 'Free'
                                : '\$${state.product.productPrice?.toStringAsFixed(0) ?? ''}',
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 5),
                    BuildProductImageGallery(
                      imageGallery: state.product.imageGallery,
                      selectedIndex: state.selectedImageIndex,
                      onTapImage: (index) {
                        context.read<SingleProductBloc>().add(
                          ChangeProductImage(index),
                        );
                      },
                    ),
                    SizedBox(height: 10),
                    BuildProductVariantGallery(variant: state.product.variant),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "Description",
                        style: theme.textTheme.labelLarge?.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(height: 4),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: ExpandableText(
                        state.product.productDetails ?? "No more details",
                        maxLines: 3,
                        expandText: 'Read more',
                        collapseText: 'Read less',
                        linkColor: theme.brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black,
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    SizedBox(height: 25),
                    // product reviews
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Reviews',
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontSize: 18,
                              color: theme.colorScheme.onBackground,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            'View All',
                            style: theme.textTheme.labelSmall?.copyWith(
                              fontSize: 15,
                              color: theme.colorScheme.outline,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: reviews.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        final data = reviews[index];

                        return ReviewCard(
                          name: data["name"],
                          date: data["date"],
                          rating: data["rating"],
                          review: data["review"],
                          imageUrl: data["image"],
                        );
                      },
                    ),
                    SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Align(
                        alignment: AlignmentGeometry.centerRight,
                          child: AppPrimaryButton(
                              width: 170,
                              height: 50,
                              icon: Icon(
                                Icons.reviews,
                                color: Colors.white,
                                size: 20,
                              ),
                              text: "Add review",
                              radius: 10,
                              onTap: () {
                                context.goNamed(
                                    Routes.review,
                                    extra: {'id': state.product.productId},
                                );
                              },
                          ),
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                );
              }

              if (state is SingleProductFetchFailed) {
                return Center(child: Text(state.message));
              }

              return const SizedBox();
            },
          ),
        ),
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            tileColor: theme.colorScheme.surfaceVariant,
            title: Text(
              'Total Price',
              style: theme.textTheme.labelLarge?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
                fontWeight: FontWeight.w600,
              ),
            ),
            subtitle: Text(
              'with VAT,SD',
              style: theme.textTheme.labelSmall?.copyWith(
                color: theme.colorScheme.outline,
                fontWeight: FontWeight.w300,
              ),
            ),
            trailing: BlocBuilder<SingleProductBloc, SingleProductState>(
              builder: (context, state) {
                final double vat = state is SingleProductFetchSuccess
                    ? state.product.vatSd ?? 0.0
                    : 0.0;
                debugPrint('Vat $vat');
                final double price = state is SingleProductFetchSuccess
                    ? state.product.productPrice ?? 0.0
                    : 0.0;
                debugPrint('Vat $price');
                final double totalPrice = vat + price;
                debugPrint('Vat $totalPrice');
                return Text(
                  '\$${totalPrice.toStringAsFixed(2)}',
                  style: theme.textTheme.labelLarge?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                    fontWeight: FontWeight.w900,
                  ),
                );
              },
            ),
          ),
          AppPrimaryButton(text: "Add to Cart", radius: 0, onTap: () {}),
        ],
      ),
    );
  }
}
