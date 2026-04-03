import 'package:bloc_ecommerce_app/core/global_widgets/app_primary_button.dart';
import 'package:bloc_ecommerce_app/core/global_widgets/custom_text_field.dart';
import 'package:bloc_ecommerce_app/core/routes/routes.dart';
import 'package:bloc_ecommerce_app/features/blocs/login/login_bloc.dart';
import 'package:bloc_ecommerce_app/features/blocs/login/login_event.dart';
import 'package:bloc_ecommerce_app/features/blocs/login/login_state.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 100.h),
            Center(
              child: Column(
                children: [
                  Text(
                    "Welcome",
                    style: TextStyle(
                      fontSize: 22.sp,
                      color: theme.colorScheme.inverseSurface,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "Please enter your data to continue",
                    style: TextStyle(
                      fontSize: 15.sp,
                      color: theme.hintColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 60.h),
            BlocConsumer<LoginBloc, LoginState>(
              listener: (BuildContext context, state) {
                if (state is LoginSuccess) {
                  context.goNamed(Routes.bottomNavBar);
                }

                if (state is LoginFailed) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text(state.message)));
                }
              },
              builder: (context, state) {
                final bloc = context.read<LoginBloc>();
                final isPasswordVisible = state is LoginInitial
                       ? state.isPasswordVisible
                       : false;

                return Column(
                  children: [
                    CustomTextField(
                      controller: bloc.emailController,
                      hinText: "Enter Email",
                      prefixIcon: const Icon(Icons.mail_outline),
                    ),
                    SizedBox(height: 16.h),
                    CustomTextField(
                      controller: bloc.passwordController,
                      hinText: "Enter Password",
                      prefixIcon: const Icon(Icons.lock_outline),
                      obsecureText: !isPasswordVisible,
                      suffixIcon: IconButton(
                        icon: Icon(
                          isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                        ),
                        onPressed: () {
                          context.read<LoginBloc>().add(TogglePasswordVisibility());
                        },
                      ),
                    ),
                  ],
                );
              },
            ),
            SizedBox(height: 20.h),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                "Forget your password?",
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: theme.colorScheme.onSecondaryContainer,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(height: 80.h),
            BlocBuilder<LoginBloc, LoginState>(
              builder: (context, state) {
                final isLoading = state is LoginLoading;

                return AppPrimaryButton(
                  text: "Login",
                  isLoading: isLoading,
                  onTap: () {
                    if (isLoading) return;
                    final bloc = context.read<LoginBloc>();
                    bloc.add(RequestEmailLogin(
                      email: bloc.emailController.text.trim(),
                      password: bloc.passwordController.text.trim(),
                    ));
                  },
                );
              },
            ),
            SizedBox(height: 20.h),
            Center(
              child: RichText(
                text: TextSpan(
                  text: "Create a new account? ",
                  style: TextStyle(color: theme.hintColor, fontSize: 16),
                  children: [
                    TextSpan(
                      text: "Sign Up",
                      style: TextStyle(
                        color: theme.colorScheme.primary,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          context.goNamed(Routes.register);
                        },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
