import 'package:flutter/material.dart';

class TopActionBar extends StatelessWidget {
  final VoidCallback? onBackTap;
  final VoidCallback? onCartTap;

  const TopActionBar({
    super.key,
    this.onBackTap,
    this.onCartTap,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 10,
      left: 20,
      right: 20,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _circleButton(
            context: context,
            icon: Icons.arrow_back,
            onTap: onBackTap ?? () => Navigator.pop(context),
          ),
          _circleButton(
            context: context,
            icon: Icons.shopping_cart_outlined,
            onTap: onCartTap ?? () {},
          ),
        ],
      ),
    );
  }

  Widget _circleButton({
    required BuildContext context,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(9),
        decoration: BoxDecoration(
          color: Colors.grey.withValues(alpha: 0.08),
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          size: 22,
          color: Colors.black,
        ),
      ),
    );
  }
}