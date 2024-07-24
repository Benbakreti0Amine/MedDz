import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:happy_tech_mastering_api_with_flutter/static/colors.dart';

import '../cubit/user_cubit.dart';
import '../cubit/user_state.dart';
import '../widgets/custom_form_button.dart';
import '../widgets/custom_input_field.dart';
import '../widgets/dont_have_an_account.dart';
import '../widgets/forget_password_widget.dart';
import '../widgets/page_heading.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: BlocConsumer<UserCubit, UserState>(
        listener: (context, state) {
          if (state is SignInSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("success"),
              ),
            ); //
            // context.read<UserCubit>().getUserData();
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => const ProfileScreen(),
            //   ),
            // );
          } else if (state is SignInFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errMessage),
              ),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: SingleChildScrollView(
              child: Form(
                key: context.read<UserCubit>().signInFormKey,
                child: Column(
                  children: [
                    const PageHeading(
                      title: 'Sign-in',
                      txtcolor: AppColors.primary,
                      bgcolor: AppColors.white,
                      isThereIcons: false,
                    ),
                    SizedBox(height: size.height * 0.0035),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Welcome",
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium
                                ?.copyWith(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.primary,
                                ),
                          ),
                          Text(
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ",
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium
                                ?.copyWith(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: size.height * 0.05),
                    //!Email
                    CustomInputField(
                      labelText: 'Email',
                      hintText: 'Your email',
                      controller: context.read<UserCubit>().signInEmail,
                    ),
                    const SizedBox(height: 16),
                    //!Password
                    CustomInputField(
                      labelText: 'Password',
                      hintText: 'Your password',
                      obscureText: true,
                      suffixIcon: true,
                      controller:
                          context.read<UserCubit>().signInPassword,
                    ),
                    const SizedBox(height: 16),
                    ForgetPasswordWidget(size: size),
                    const SizedBox(height: 20),
                    state is SignInLoading
                        ? const CircularProgressIndicator()
                        : CustomFormButton(
                            innerText: 'Sign In',
                            onPressed: () {
                              final formKey =
                                  context.read<UserCubit>().signInFormKey;
                              if (formKey.currentState?.validate() ??
                                  false) {
                                context.read<UserCubit>().signIn();
                              }
                            },
                            widthpourcentage: 0.8,
                            bgcolor: AppColors.primary,
                            txtcolor: AppColors.white,
                          ),
                    const SizedBox(height: 18),
                    const Text(
                      'or signup with',
                      style: TextStyle(
                          fontSize: 13,
                          color: Color(0xff939393),
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 18),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Iconsbutton(
                            txtcolor: AppColors.primary,
                            icon: Icons.g_mobiledata_outlined),
                        Iconsbutton(
                            txtcolor: AppColors.primary, icon: Icons.facebook),
                      ],
                    ),
                    const SizedBox(height: 28),
                    //! Dont Have An Account ?
                    DontHaveAnAccountWidget(size: size),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
