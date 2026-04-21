import 'package:bloc_ecommerce_app/core/routes/routes.dart';
import 'package:bloc_ecommerce_app/features/presentation/auth/login/screens/login_screen.dart';
import 'package:bloc_ecommerce_app/features/presentation/auth/register/screens/register_screen.dart';
import 'package:bloc_ecommerce_app/features/presentation/bottom_nav/screens/bottom_nav_bar_screen.dart';
import 'package:bloc_ecommerce_app/features/presentation/home/screens/home_screen.dart';
import 'package:bloc_ecommerce_app/features/presentation/product_details/screens/products_details_screen.dart';
import 'package:bloc_ecommerce_app/features/presentation/splash/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RoutePages {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: Routes.splash,
        name: Routes.splash,
        pageBuilder: (context, state) => const MaterialPage(child: SplashScreen()),
      ),
      GoRoute(
        path: Routes.login,
        name: Routes.login,
        pageBuilder: (context, state) => MaterialPage(child: LoginScreen()),
      ),
      GoRoute(
        path: Routes.register,
        name: Routes.register,
        pageBuilder: (context, state) => MaterialPage(child: RegisterScreen()),
      ),
      GoRoute(
        path: Routes.bottomNavBar,
        name: Routes.bottomNavBar,
        pageBuilder: (context, state) => MaterialPage(child: BottomNavBarScreen()),
      ),
      GoRoute(
        path: Routes.home,
        name: Routes.home,
        pageBuilder: (context, state) => MaterialPage(child: HomeScreen()),
      ),
      GoRoute(
        path: Routes.productsDetails,
        name: Routes.productsDetails,
        pageBuilder: (context, state) => MaterialPage(child: ProductsDetailsScreen()),
      ),
    ],
  );
}
