import 'package:bloc_ecommerce_app/core/routes/routes_pages.dart';
import 'package:bloc_ecommerce_app/core/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BlocEcommerceApp extends StatelessWidget {
  const BlocEcommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [],
      child: MultiBlocProvider(
        providers: [],
        child: ScreenUtilInit(
          designSize: const Size(360, 690),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (_, child) {
            return MaterialApp.router(
              theme: const MaterialTheme(TextTheme()).light(),
              darkTheme: const MaterialTheme(TextTheme()).dark(),
              debugShowCheckedModeBanner: false,
              routerConfig: RoutePages.router,
            );
          },
        ),
      ),
    );
  }
}