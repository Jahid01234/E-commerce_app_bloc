import 'package:bloc_ecommerce_app/core/data/models/product_model.dart';
import 'package:flutter/material.dart';

class BuildProductVariantGallery extends StatelessWidget {
  final List<Variant>? variant;

  const BuildProductVariantGallery({
    super.key,
    required this.variant,
  });



  @override
  Widget build(BuildContext context) {
    final layout = MediaQuery.of(context);
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          variant?.length ?? 0,
              (index) {
            final variantItem = variant![index];

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                /// Title
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      variantItem.category ?? '',
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontSize: 18,
                        color: theme.colorScheme.onBackground,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'Size Guide',
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: Colors.grey,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),

                /// Items List
                SizedBox(
                  height: layout.size.width * 0.16,
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: variantItem.items.length,
                    separatorBuilder: (_, __) {
                      return SizedBox(width: 10);
                    },
                    itemBuilder: (context, index) {
                      final item = variantItem.items[index];
                      return AspectRatio(
                        aspectRatio: 1,
                        child: Card(
                          elevation: 0.2,
                          child: Center(
                            child: Text(
                              item.title ?? '',
                              style: theme.textTheme.titleLarge?.copyWith(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}