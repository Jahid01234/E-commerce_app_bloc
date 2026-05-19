import 'package:flutter/material.dart';

class FavouriteHeaderSection extends StatelessWidget {
  final ThemeData theme;

  const FavouriteHeaderSection({super.key, required this.theme});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Favourite',
        style: theme.textTheme.titleMedium?.copyWith(
          fontSize: 18,
          color: theme.colorScheme.onBackground,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
