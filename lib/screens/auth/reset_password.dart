import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../BLOC/cubit/user_cubit.dart';
import '../../BLOC/cubit/user_state.dart';
import '../../static/colors.dart';
import '../../widgets/custom_form_button.dart';
import '../../widgets/custom_input_field.dart';
import '../../widgets/page_heading.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: BlocConsumer<UserCubit, UserState>(
        listener: (context, state) {
          if (state is PasswordResetSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("password changed successfully"),
                backgroundColor: AppColors.primary,
              ),
            );
          } else if (state is PasswordResetFailed) {
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
                key: context.read<UserCubit>().passwordResetFormKey,
                child: Column(
                  children: [
                    const PageHeading(
                      title: 'Reset Password',
                      txtcolor: AppColors.primary,
                      bgcolor: AppColors.white,
                      isThereIcons: false,
                    ),
                    SizedBox(height: size.height * 0.05),

                    
                    CustomInputField(
                      labelText: 'OTP',
                      hintText: 'Enter OTP sent to your email',
                      controller: context.read<UserCubit>().otp,
                    ),

                    const SizedBox(height: 15),

                    CustomInputField(
                      labelText: 'Password',
                      hintText: 'Enter your new password',
                      controller: context.read<UserCubit>().resetpassword,
                    ),

                    // CustomInputField(
                    //   labelText: 'Confirm Password',
                    //   hintText: 'Confirm your new password',
                    // ),
                    const SizedBox(height: 15),
                    state is passwordResetLoading
                        ? const CircularProgressIndicator()
                        : CustomFormButton(
                            innerText: 'Done',
                            onPressed: () {
                              final formKey = context
                                  .read<UserCubit>()
                                  .passwordResetFormKey;
                              if (formKey.currentState?.validate() ?? false) {
                                context.read<UserCubit>().ResetPassword();
                              }
                            },
                            widthpourcentage: 0.3,
                            bgcolor: AppColors.primary,
                            txtcolor: AppColors.white,
                          ),
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
