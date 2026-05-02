import 'package:bloc_ecommerce_app/core/global_widgets/app_back_button.dart';
import 'package:flutter/material.dart';

class ReviewScreen extends StatelessWidget {
  const ReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(height: size.height* 0.05),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppBackButton(),
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
              ),
              Expanded(
                  child: SizedBox(),
              ),
            ],
          ),
        ),
    );
  }
}
