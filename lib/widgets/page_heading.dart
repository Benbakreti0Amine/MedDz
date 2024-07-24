import 'package:flutter/material.dart';
import 'package:happy_tech_mastering_api_with_flutter/static/colors.dart';

class PageHeading extends StatelessWidget {
  final String title;
  final Color bgcolor;
  final Color txtcolor;
  final bool isThereIcons;
  const PageHeading(
      {Key? key,
      required this.title,
      required this.bgcolor,
      required this.txtcolor,
      required this.isThereIcons})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      color: bgcolor,
      width: size.width,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: IconButton(
              onPressed: Navigator.of(context).pop,
              icon: Icon(
                Icons.arrow_back_ios_new,
                size: 20,
                color: txtcolor,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: size.height * 0.005),  
            child: Center(
              child: Text(
                title,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      color: txtcolor,
                    ),
              ),
            ),
          ),
          // Optional icons aligned to the right
          if (isThereIcons)
            Align(
              alignment: Alignment.centerRight,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Iconsbutton(
                      txtcolor: txtcolor,
                      icon: Icons.notifications_active_outlined),
                  Iconsbutton(txtcolor: txtcolor, icon: Icons.settings),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class Iconsbutton extends StatelessWidget {
  const Iconsbutton({
    super.key,
    required this.txtcolor,
    required this.icon,
    this.onpressed,
  });

  final Color txtcolor;
  final IconData icon;
  final void Function()? onpressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 8),
      decoration: BoxDecoration(
        color: AppColors.secondary,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        onPressed: onpressed,
        icon: Icon(
          icon,
          color: txtcolor,
        ),
      ),
    );
  }
}
