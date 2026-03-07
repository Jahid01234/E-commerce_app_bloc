import 'package:bloc_ecommerce_app/app.dart';
import 'package:bloc_ecommerce_app/core/services/shared_preferences/local_preferences.dart';
import 'package:bloc_ecommerce_app/features/blocs/bloc_ecommerce_observer.dart';
import 'package:bloc_ecommerce_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = BlocEcommerceObserver();
  await LocalPreferences().init();
  runApp(const BlocEcommerceApp());
}

