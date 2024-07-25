import 'package:flutter/material.dart';
import 'package:happy_tech_mastering_api_with_flutter/screens/auth/forget_password.dart';

class ForgetPasswordWidget extends StatelessWidget {
  const ForgetPasswordWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * 0.80,
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onTap: () => {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ForgetPasswordScreen(),
            ),
          )
        },
        child: const Text(
          'Forget password?',
          style: TextStyle(
            color: Color(0xff939393),
            fontSize: 13,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
