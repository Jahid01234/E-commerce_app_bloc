import 'package:bloc_ecommerce_app/core/routes/routes.dart';
import 'package:bloc_ecommerce_app/core/utils/images_path.dart';
import 'package:bloc_ecommerce_app/features/blocs/splash/splash_cubit.dart';
import 'package:bloc_ecommerce_app/features/blocs/splash/splash_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
      body: BlocListener<SplashCubit,SplashState>(
        listener: (BuildContext context, state) {
          if(state is SplashEnd){
            context.goNamed(Routes.login);
          }
        },
        child: Center(
          child: SvgPicture.asset(
            ImagesPath.splashImg,
            height: 50.h,
            width: 80.w,
          ),
        ),
      ),
    );
  }
}
