import 'package:bloc_ecommerce_app/app.dart';
import 'package:bloc_ecommerce_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // Bloc.observer = BlocEcommerceObserver();
 // await LocalPreferences().init();
  runApp(const BlocEcommerceApp());
}

