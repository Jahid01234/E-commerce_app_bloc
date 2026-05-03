import 'package:bloc_ecommerce_app/core/global_widgets/app_back_button.dart';
import 'package:bloc_ecommerce_app/core/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';



class ReviewHeaderSection extends StatelessWidget {
  final ThemeData theme;

  const ReviewHeaderSection({
    super.key,
    required this.theme,
  });


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppBackButton(onTap: () => context.goNamed(Routes.productsDetails)),
        Text(
          'Add Reviews',
          style: theme.textTheme.titleMedium?.copyWith(
            fontSize: 18,
            color: theme.colorScheme.onBackground,
            fontWeight: FontWeight.w600,
          ),
        ),
        Opacity(
          opacity: 0,
          child: SizedBox(width: 40),
        ),
      ],
    );
  }
}
