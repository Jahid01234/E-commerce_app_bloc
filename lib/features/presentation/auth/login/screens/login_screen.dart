import 'package:bloc_ecommerce_app/core/global_widgets/app_primary_button.dart';
import 'package:bloc_ecommerce_app/core/global_widgets/custom_text_field.dart';
import 'package:bloc_ecommerce_app/features/blocs/login/login_bloc.dart';
import 'package:bloc_ecommerce_app/features/blocs/login/login_event.dart';
import 'package:bloc_ecommerce_app/features/blocs/login/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (_) => LoginBloc(),
      child: Scaffold(
        body: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {

            final bloc = context.read<LoginBloc>();

            return SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  SizedBox(height: 80.h),

                  Center(
                    child: Column(
                      children: [
                        Text(
                          "Welcome",
                          style: TextStyle(
                              fontSize: 22.sp,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "Please enter your data to continue",
                          style: TextStyle(
                              fontSize: 15.sp,
                              color: Colors.grey),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 30.h),

                  CustomTextField(
                    controller: emailController,
                    hinText: "Enter Email",
                    prefixIcon: const Icon(Icons.mail_outline),
                    onChanged: (value) {
                      bloc.add(EmailChanged(value));
                    },
                  ),

                  SizedBox(height: 16.h),

                  CustomTextField(
                    controller: passwordController,
                    hinText: "Enter Password",
                    obsecureText: state.isPasswordHidden,
                    prefixIcon: const Icon(Icons.lock_outline),
                    onChanged: (value) {
                      bloc.add(PasswordChanged(value));
                    },
                  ),

                  SizedBox(height: 20),

                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "Forget your password?",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.teal,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),

                  SizedBox(height: 60.h),

                  state.isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : AppPrimaryButton(
                    text: "Login",
                    onTap: () {
                      bloc.add(LoginSubmitted());
                    },
                  ),

                  if (state.errorMessage != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Text(
                        state.errorMessage!,
                        style: const TextStyle(color: Colors.red),
                      ),
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}