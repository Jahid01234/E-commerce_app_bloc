import 'package:bloc_ecommerce_app/core/utils/images_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
      body: Center(
        child: SvgPicture.asset(
          ImagesPath.splashImg,
          height: 50.h,
          width: 80.w,
        ),
      ),
    );
  }
}
