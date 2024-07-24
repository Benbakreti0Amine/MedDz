import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:happy_tech_mastering_api_with_flutter/screens/sign_up_screen.dart';
import 'package:happy_tech_mastering_api_with_flutter/static/colors.dart';
import 'package:happy_tech_mastering_api_with_flutter/widgets/custom_form_button.dart';
import 'sign_in_screen.dart'; // Make sure to import SignInScreen

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Container(
          width: size.width * 0.75,
          height: size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: size.height * 0.1,
              ),
              SvgPicture.asset(
                "assets/images/register.svg",
                width: 138,
                height: 138,
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              Text(
                "Skin",
                style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      fontSize: 40,
                      fontWeight: FontWeight.w400,
                      color: AppColors.primary,
                    ),
              ),
              Text(
                "Firts",
                style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      fontSize: 40,
                      fontWeight: FontWeight.w400,
                      color: AppColors.primary,
                    ),
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              Text(
                "Dermatology center",
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      fontSize: 13,
                      fontWeight: FontWeight.w900,
                      color: AppColors.primary,
                    ),
              ),
              SizedBox(
                height: size.height * 0.15,
              ),
              Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ",
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      fontSize: 13,
                      fontWeight: FontWeight.w900,
                    ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              CustomFormButton(
                innerText: "Log In",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignInScreen()),
                  );
                },
                widthpourcentage: 0.4, bgcolor: AppColors.primary, txtcolor: AppColors.white,
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              CustomFormButton(
                innerText: "Sign Up",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignUpScreen()),
                  );
                },
                widthpourcentage: 0.4, bgcolor: AppColors.secondary, txtcolor: AppColors.primary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
