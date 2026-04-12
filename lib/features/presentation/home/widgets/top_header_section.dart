import 'package:bloc_ecommerce_app/core/utils/icons_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TopHeaderSection extends StatelessWidget {
  const TopHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _containerWidget(context,IconsPath.menu),
          _containerWidget(context,IconsPath.cartBag)
        ],
      ),
    );
  }
  Widget _containerWidget(BuildContext context, String iconsPath){
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        color: Colors.grey.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Padding(
        padding: const EdgeInsets.all(13),
        child: SvgPicture.asset(
          iconsPath,
          colorFilter: ColorFilter.mode(
              Theme.of(context).brightness == Brightness.dark
                ? Colors.white
                : Colors.black,
              BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}
