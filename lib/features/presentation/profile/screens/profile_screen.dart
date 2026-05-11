import 'package:bloc_ecommerce_app/core/repository/auth_repository.dart';
import 'package:bloc_ecommerce_app/core/routes/routes.dart';
import 'package:bloc_ecommerce_app/core/services/shared_preferences/local_preferences.dart';
import 'package:bloc_ecommerce_app/features/blocs/theme/theme_cubit.dart';
import 'package:bloc_ecommerce_app/features/presentation/profile/widgets/profile_component.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: const Text("Profile"), centerTitle: true),
      body: Column(
        children: [
          SizedBox(height: size.height * 0.05),
          Center(
            child: CircleAvatar(
              radius: 45,
              backgroundColor: Colors.grey.shade200,
              child: CachedNetworkImage(
                imageUrl: LocalPreferences.getString('photoUrl'),
                width: 80,
                height: 80,
                fit: BoxFit.cover,
                placeholder: (context, url) =>
                    const CircularProgressIndicator(strokeWidth: 2),
                errorWidget: (context, url, error) =>
                    const Icon(Icons.person, size: 40),
              ),
            ),
          ),
          const SizedBox(height: 15),
          Text(
            LocalPreferences.getString('username'),
            style: TextStyle(
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white
                  : Colors.black,
              fontSize: 23,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            LocalPreferences.getString('email'),
            style: TextStyle(
              color: Colors.grey,
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
          ),

          const SizedBox(height: 50),

          Expanded(
            child: Column(
              children: [
                BlocBuilder<ThemeCubit, ThemeMode>(
                  builder: (context, themeMode) {
                    final isDark = themeMode == ThemeMode.dark;

                    return ProfileComponentTile(
                      icon: Icons.dark_mode_outlined,
                      title: "Theme",
                      showSwitch: true,
                      switchValue: isDark,
                      onSwitchChanged: (value) {
                        context.read<ThemeCubit>().toggleTheme(value);
                      },
                    );
                  },
                ),
                ProfileComponentTile(
                  titleColor: Colors.red,
                  icon: Icons.logout,
                  title: "Log Out",
                  onTap: () async {
                    await AuthRepository().signOutUser();
                    if (context.mounted) {
                      context.goNamed(Routes.login);
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
