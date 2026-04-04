import 'package:bloc_ecommerce_app/core/global_widgets/app_primary_button.dart';
import 'package:bloc_ecommerce_app/core/global_widgets/custom_text_field.dart';
import 'package:bloc_ecommerce_app/core/routes/routes.dart';
import 'package:bloc_ecommerce_app/features/blocs/register/register_bloc.dart';
import 'package:bloc_ecommerce_app/features/blocs/register/register_event.dart';
import 'package:bloc_ecommerce_app/features/blocs/register/register_state.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

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
                    "Create Account",
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
            BlocConsumer<RegisterBloc, RegisterState>(
              listener: (BuildContext context, state) {
                if (state is RegisterSuccess) {
                  //............................
                  context.goNamed(Routes.bottomNavBar);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Create account successful.")),
                  );
                }

                if (state is RegisterFailed) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text(state.message)));
                }
              },

              builder: (context, state) {
                final bloc = context.read<RegisterBloc>();
                final isPasswordVisible = state is RegisterInitial
                    ? state.isPasswordVisible
                    : false;

                return Column(
                  children: [
                    CustomTextField(
                      controller: bloc.userNameController,
                      hinText: "Enter Username",
                      prefixIcon: const Icon(Icons.person_outline),
                    ),
                    SizedBox(height: 16.h),
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
                          isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          context.read<RegisterBloc>().add(
                            TogglePasswordVisibilityRegister(),
                          );
                        },
                      ),
                    ),
                  ],
                );
              },
            ),

            SizedBox(height: 80.h),
            BlocBuilder<RegisterBloc, RegisterState>(
              builder: (context, state) {
                final isLoading = state is RegisterLoading;
                return AppPrimaryButton(
                  text: "Sign Up",
                  isLoading: isLoading,
                  onTap: () {
                    if (isLoading) return;
                    final bloc = context.read<RegisterBloc>();
                    bloc.add(
                      RequestEmailRegister(
                        userName: bloc.userNameController.text.trim(),
                        email: bloc.emailController.text.trim(),
                        password: bloc.passwordController.text.trim(),
                      ),
                    );
                  },
                );
              },
            ),
            SizedBox(height: 20.h),
            Center(
              child: RichText(
                text: TextSpan(
                  text: "Already have an account? ",
                  style: TextStyle(color: theme.hintColor, fontSize: 16),
                  children: [
                    TextSpan(
                      text: "Login",
                      style: TextStyle(
                        color: theme.colorScheme.primary,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          context.goNamed(Routes.login);
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
