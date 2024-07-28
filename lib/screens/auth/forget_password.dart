import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../../widgets/custom_form_button.dart';
import '../../../widgets/custom_input_field.dart';
import '../../../widgets/page_heading.dart';
import '../../cubit/user_cubit.dart';
import '../../cubit/user_state.dart';
import '../../static/colors.dart';
import 'reset_password.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: BlocConsumer<UserCubit, UserState>(
        listener: (context, state) {
          if (state is PasswordForgetSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Reset link sent to your email"),
              ),
            );
             context.read<UserCubit>().emailforgetpassword.clear();
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ResetPasswordScreen()));
          } else if (state is PasswordForgetFailed) {
            print(state.errMessage);
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
                key: context.read<UserCubit>().passwordForgetFormKey,
                child: Column(
                  children: [
                    const PageHeading(
                      title: 'Forget Password',
                      txtcolor: AppColors.primary,
                      bgcolor: AppColors.white,
                      isThereIcons: false,
                    ),
                    SizedBox(height: size.height * 0.05),

                    //! Recovery Email
                    CustomInputField(
                      labelText: 'Recovery Email',
                      hintText: 'Enter your email',
                      controller: context.read<UserCubit>().emailforgetpassword,
                    ),

                    const SizedBox(height: 15),
                    state is passwordForgetLoading
                        ? const CircularProgressIndicator()
                        : CustomFormButton(
                            innerText: 'Done',
                            onPressed: () {
                              final formKey = context
                                  .read<UserCubit>()
                                  .passwordForgetFormKey;
                              if (formKey.currentState?.validate() ?? false) {
                                context.read<UserCubit>().forgetPassword();
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
