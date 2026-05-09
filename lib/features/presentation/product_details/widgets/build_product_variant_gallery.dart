import 'package:bloc_ecommerce_app/core/data/models/product_model.dart';
import 'package:flutter/material.dart';

class BuildProductVariantGallery extends StatelessWidget {
  final List<Variant>? variant;
  final int selectedIndex;
  final Function(int) onTap;

  const BuildProductVariantGallery({
    super.key,
    required this.variant,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final layout = MediaQuery.of(context);
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          variant?.length ?? 0,
              (vIndex) {
            final variantItem = variant![vIndex];

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      variantItem.category ?? '',
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Text(
                      'Size Guide',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),

                SizedBox(
                  height: layout.size.width * 0.16,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: variantItem.items.length,
                    separatorBuilder: (_, __) => const SizedBox(width: 10),
                    itemBuilder: (context, index) {
                      final item = variantItem.items[index];

                      //final isSelected = index == selectedIndex;

                      return GestureDetector(
                        onTap: () => onTap(index),
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: Card(
                            color: selectedIndex == index
                                ? theme.colorScheme.primary
                                : (theme.brightness == Brightness.dark
                                ? Colors.grey.shade900
                                : Colors.grey.shade50),
                            child: Center(
                              child: Text(
                                item.title ?? '',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: selectedIndex == index ? Colors.white : null,
                                ),
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