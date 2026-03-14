import 'package:bloc_ecommerce_app/core/routes/routes.dart';
import 'package:bloc_ecommerce_app/features/presentation/auth/login/screens/login_screen.dart';
import 'package:bloc_ecommerce_app/features/presentation/splash/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RoutePages {
  static final router = GoRouter(
    routes: [
      GoRoute(
          path: Routes.splash,
          name: Routes.splash,
          pageBuilder: (context, state) =>
          const MaterialPage(child: SplashScreen()),
      ),
      GoRoute(
          path: Routes.login,
          name: Routes.login,
          pageBuilder: (context, state) =>
           MaterialPage(child: LoginScreen()),
      ),
    ],
  );
}