import 'package:bloc_ecommerce_app/core/global_widgets/app_back_button.dart';
import 'package:bloc_ecommerce_app/core/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CartHeaderSection extends StatelessWidget {
  final ThemeData theme;

  const CartHeaderSection({super.key, required this.theme});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Cart',
        style: theme.textTheme.titleMedium?.copyWith(
          fontSize: 18,
          color: theme.colorScheme.onBackground,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
