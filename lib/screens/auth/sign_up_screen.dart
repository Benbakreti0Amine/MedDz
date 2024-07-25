
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:happy_tech_mastering_api_with_flutter/static/colors.dart';

import '../../cubit/user_cubit.dart';
import '../../cubit/user_state.dart';
import '../../widgets/already_have_an_account_widget.dart';
import '../../widgets/custom_form_button.dart';
import '../../widgets/custom_input_field.dart';
import '../../widgets/page_heading.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<UserCubit, UserState>(
        listener: (context, state) {
          if (state is SignUpSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.message),
            ));
          } else if (state is SignUpFailure) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.errMessage),
            ));
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: SingleChildScrollView(
              child: Form(
                key: context.read<UserCubit>().signUpFormKey,
                child: Column(
                  children: [
                    const PageHeading(title: 'Sign-up', bgcolor: AppColors.white, txtcolor: AppColors.primary, isThereIcons: false,),
                    //! Image
                    // const PickImageWidget(),
                    const SizedBox(height: 16),
                    //! Name
                    CustomInputField(
                      labelText: 'Username',
                      hintText: 'Your Username',
                      controller: context.read<UserCubit>().signUpName,
                    ),
                    const SizedBox(height: 16),
                    //!Email
                    CustomInputField(
                      labelText: 'Email',
                      hintText: 'Your email',
                      controller: context.read<UserCubit>().signUpEmail,
                    ),
                    const SizedBox(height: 16),
                    //! Phone Number
                    CustomInputField(
                      labelText: 'First name',
                      hintText: 'Your first name',
                      controller: context.read<UserCubit>().signUpFirstname,
                    ),
                    const SizedBox(height: 16),
                    CustomInputField(
                      labelText: 'Last name',
                      hintText: 'Your last name',
                      controller: context.read<UserCubit>().signUpLastname,
                    ),
                    const SizedBox(height: 16),
                    //! Password
                    CustomInputField(
                      labelText: 'Password',
                      hintText: 'Your password',
                      obscureText: true,
                      suffixIcon: true,
                      controller: context.read<UserCubit>().signUpPassword,
                    ),
                    //! Confirm Password

                    const SizedBox(height: 22),
                    //!Sign Up Button
                    state is SignUpLoading
                        ? const CircularProgressIndicator()
                        : CustomFormButton(
                            innerText: 'Signup',
                            onPressed: () {
                              final formKey =
                                  context.read<UserCubit>().signUpFormKey;
                              if (formKey.currentState?.validate() ?? false) {
                                context.read<UserCubit>().signUp();
                              } 
                            },widthpourcentage: 0.8, bgcolor: AppColors.primary, txtcolor: AppColors.white,
                          ),
                    const SizedBox(height: 18),
                    //! Already have an account widget
                    const AlreadyHaveAnAccountWidget(),
                    const SizedBox(height: 30),
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
