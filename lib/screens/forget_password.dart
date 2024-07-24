import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:happy_tech_mastering_api_with_flutter/static/colors.dart';

import '../cubit/user_cubit.dart';
import '../cubit/user_state.dart';
import '../widgets/custom_form_button.dart';
import '../widgets/custom_input_field.dart';
import '../widgets/page_heading.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // return SafeArea(
      // child: BlocConsumer<UserCubit, UserState>(
      //   // listener: (context, state) {
      //   //   if (state is PasswordResetSuccess) {
      //   //     ScaffoldMessenger.of(context).showSnackBar(
      //   //       const SnackBar(
      //   //         content: Text("Password reset successful"),
      //   //       ),
      //   //     );
      //   //   } else if (state is PasswordResetFailure) {
      //   //     ScaffoldMessenger.of(context).showSnackBar(
      //   //       SnackBar(
      //   //         content: Text(state.errMessage),
      //   //       ),
      //   //     );
      //   //   }
      //   // },
        // builder: (context, state) {
          return Scaffold(
            body: SingleChildScrollView(
              child: Form(
                // key: context.read<UserCubit>().passwordResetFormKey,
                child: Column(
                  children: [
                    const PageHeading(
                      title: 'Forget Password',
                      txtcolor: AppColors.primary,
                      bgcolor: AppColors.white,
                      isThereIcons: false,
                    ),
                    SizedBox(height: size.height * 0.05),
                    
                    SizedBox(height: size.height * 0.05),
                    //!Password
                    CustomInputField(
                      labelText: 'Password',
                      hintText: 'Enter new password',
                      obscureText: true,
                      suffixIcon: true,
                      // controller: context.read<UserCubit>().newPassword,
                    ),
                    const SizedBox(height: 16),
                    //!Confirm Password
                    CustomInputField(
                      labelText: 'Confirm Password',
                      hintText: 'Confirm new password',
                      obscureText: true,
                      suffixIcon: true,
                      // controller: context.read<UserCubit>().confirmPassword,
                    ),
                    const SizedBox(height: 20),
                    // state is PasswordResetLoading
                    //     ? const CircularProgressIndicator():
                        //  CustomFormButton(
                        //     innerText: 'Create New Password',
                        //     onPressed: () {
                        //       // final formKey = context.read<UserCubit>().passwordResetFormKey;
                        //       // if (formKey.currentState?.validate() ?? false) {
                        //       //   context.read<UserCubit>().resetPassword();
                        //       }
                        //     },
                          //   widthpourcentage: 0.8,
                          //   bgcolor: AppColors.primary,
                          //   txtcolor: AppColors.white,
                          // ),
                  ],
                ),
              ),
            ),
          );
    //     },
    //   ),
    // );
  }
}
