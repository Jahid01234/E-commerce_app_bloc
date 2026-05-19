import 'package:bloc_ecommerce_app/core/repository/auth_repository.dart';
import 'package:bloc_ecommerce_app/core/repository/cart_repository.dart';
import 'package:bloc_ecommerce_app/core/repository/favourite_repository.dart';
import 'package:bloc_ecommerce_app/core/repository/store_repository.dart';
import 'package:bloc_ecommerce_app/core/routes/routes_pages.dart';
import 'package:bloc_ecommerce_app/core/theme/theme.dart';
import 'package:bloc_ecommerce_app/features/blocs/bottom_nav/bottom_nav_bloc.dart';
import 'package:bloc_ecommerce_app/features/blocs/brand/brand_bloc.dart';
import 'package:bloc_ecommerce_app/features/blocs/brand/brand_event.dart';
import 'package:bloc_ecommerce_app/features/blocs/cart/add_cart_bloc.dart';
import 'package:bloc_ecommerce_app/features/blocs/cart/cart_bloc.dart';
import 'package:bloc_ecommerce_app/features/blocs/cart/cart_event.dart';
import 'package:bloc_ecommerce_app/features/blocs/login/login_bloc.dart';
import 'package:bloc_ecommerce_app/features/blocs/product/product_bloc.dart';
import 'package:bloc_ecommerce_app/features/blocs/product/product_event.dart';
import 'package:bloc_ecommerce_app/features/blocs/product/single_product_bloc.dart';
import 'package:bloc_ecommerce_app/features/blocs/register/register_bloc.dart';
import 'package:bloc_ecommerce_app/features/blocs/review/add_review_bloc.dart';
import 'package:bloc_ecommerce_app/features/blocs/review/review_bloc.dart';
import 'package:bloc_ecommerce_app/features/blocs/splash/splash_cubit.dart';
import 'package:bloc_ecommerce_app/features/blocs/theme/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BlocEcommerceApp extends StatelessWidget {
  const BlocEcommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context)=> AuthRepository()),
        RepositoryProvider(create: (context)=> StoreRepository()),
        RepositoryProvider(create: (context)=> CartRepository()),
        RepositoryProvider(create: (context)=> FavouriteRepository()),
      ],
      child: MultiBlocProvider(
          providers: [
            BlocProvider(create: (context)=>  SplashCubit()..redirectToNextScreen()),
            BlocProvider(create: (context)=>  LoginBloc(context.read<AuthRepository>())),
            BlocProvider(create: (context)=>  RegisterBloc(context.read<AuthRepository>())),
            BlocProvider(create: (context)=>  BottomNavBloc()),
            BlocProvider(create: (context) => BrandBloc(context.read<StoreRepository>())..add(FetchBrands())),
            BlocProvider(create: (context) => ProductBloc(context.read<StoreRepository>())..add(FetchProducts())),
            BlocProvider(create: (context) => SingleProductBloc(context.read<StoreRepository>())),
            BlocProvider(create: (context) => AddReviewBloc(context.read<StoreRepository>())),
            BlocProvider(create: (context) => ReviewBloc(context.read<StoreRepository>())),
            BlocProvider(create: (context) => AddCartBloc(context.read<CartRepository>())),
            BlocProvider(create: (context) => CartBloc(context.read<CartRepository>())..add(FetchCartProduct())),
            BlocProvider(create: (context) =>  ThemeCubit()..loadTheme()),
          ],
          child: ScreenUtilInit(
            designSize: const Size(360, 690),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (_, child) {
              return BlocBuilder<ThemeCubit, ThemeMode>(
                builder: (context, themeMode) {
                  return MaterialApp.router(
                    theme: const MaterialTheme(TextTheme()).light(),
                    darkTheme: const MaterialTheme(TextTheme()).dark(),
                    themeMode: themeMode,
                    debugShowCheckedModeBanner: false,
                    routerConfig: RoutePages.router,
                  );
                },
              );
            },
          ),
      ),
    );
  }
}