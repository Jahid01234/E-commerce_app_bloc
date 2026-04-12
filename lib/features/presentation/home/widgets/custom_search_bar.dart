import 'package:bloc_ecommerce_app/core/global_widgets/custom_text_field.dart';
import 'package:bloc_ecommerce_app/core/utils/icons_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Row(
        children: [
          Expanded(
            child: CustomTextField(
              controller: TextEditingController(),
              hinText: "Search your needs........",
              prefixIcon: Padding(
                padding: const EdgeInsets.all(12.0),
                child: SvgPicture.asset(IconsPath.search),
              ),
            ),
          ),
          SizedBox(width: 20),
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.indigo,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: SvgPicture.asset(
                IconsPath.voiceMic,
                colorFilter: ColorFilter.mode(
                    Colors.white,
                    BlendMode.srcIn,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
