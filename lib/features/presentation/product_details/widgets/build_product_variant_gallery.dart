import 'package:bloc_ecommerce_app/core/data/models/product_model.dart';
import 'package:flutter/material.dart';

class BuildProductVariantGallery extends StatelessWidget {
  final List<Variant>? varient;

  const BuildProductVariantGallery({
    super.key,
    required this.varient,
  });



  @override
  Widget build(BuildContext context) {
    final layout = MediaQuery.of(context);
    final theme = Theme.of(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        varient?.length ?? 0,
            (index) {
          final variantItem = varient![index];

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),

              /// Title
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      variantItem.category ?? '',
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: theme.colorScheme.onBackground,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      variantItem.category ?? '',
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: theme.colorScheme.onBackground,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
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
                        child: Center(
                          child: Text(
                            item.title ?? '',
                            style: theme.textTheme.titleLarge?.copyWith(
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
    );
  }
}