import 'package:flutter/material.dart';

class ProfileComponentTile extends StatelessWidget {
  final IconData icon;
  final Color? iconColor;
  final String title;
  final String? trailingText;
  final bool showSwitch;
  final bool switchValue;
  final Function(bool)? onSwitchChanged;
  final VoidCallback? onTap;
  final Color? titleColor;

  const ProfileComponentTile({
    super.key,
    required this.icon,
    this.iconColor,
    required this.title,
    this.trailingText,
    this.showSwitch = false,
    this.switchValue = false,
    this.onSwitchChanged,
    this.onTap,
    this.titleColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: showSwitch ? null : onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey.withValues(alpha: 0.3),
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: 22,
              color: iconColor ?? Colors.black54,
            ),
            const SizedBox(width: 16),

            // Title
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 15,
                  color: titleColor ?? Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),

            // Trailing Text
            if (trailingText != null)
              Text(
                trailingText!,
                style: const TextStyle(
                  fontSize: 13,
                  color: Colors.black54,
                ),
              ),

            // Switch
            if (showSwitch)
              Switch(
                value: switchValue,
                onChanged: onSwitchChanged,
                activeThumbColor: Colors.white,
                activeTrackColor: Colors.teal,
                inactiveThumbColor: Colors.white,
                inactiveTrackColor: Colors.grey,
              ),

            // Arrow
            if (!showSwitch)
              const Icon(
                Icons.arrow_forward_ios,
                size: 18,
                color: Colors.black38,
              ),
          ],
        ),
      ),
    );
  }
}