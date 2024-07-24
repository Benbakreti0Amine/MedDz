import 'package:flutter/material.dart';
import 'package:happy_tech_mastering_api_with_flutter/static/colors.dart';

class CustomFormButton extends StatelessWidget {
  final String innerText;
  final double widthpourcentage;
  final Color bgcolor;
  final Color txtcolor;
  final void Function()? onPressed;
  const CustomFormButton(
      {Key? key,
      required this.innerText,
      required this.onPressed,
      required this.widthpourcentage,
      required this.bgcolor,
      required this.txtcolor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * widthpourcentage,
      height: size.height * 0.05,
      decoration: BoxDecoration(
        color: bgcolor,
        borderRadius: BorderRadius.circular(26),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          innerText,
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
              fontSize: 20,
              fontWeight: FontWeight.w900,
              color: txtcolor),
        ),
      ),
    );
  }
}
