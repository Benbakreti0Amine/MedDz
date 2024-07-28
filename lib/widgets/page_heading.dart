import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:Meddz/static/colors.dart';

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
                    path: 'assets/images/icon3.svg',
                  ),
                  Iconsbutton(
                    path: 'assets/images/icon2.svg',
                  ),
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
    required this.path,
    this.onpressed,
  });
  final String path;
  final void Function()? onpressed;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.all(8),
      margin: const EdgeInsets.only(left: 8),
      decoration: BoxDecoration(
        color: AppColors.secondary,
        shape: BoxShape.circle,
      ),
      child: GestureDetector(
        onTap: () {
          onpressed!();
        },
        child: SvgPicture.asset(
          path,
          width: size.width * 0.03,
          height: size.height * 0.03,
        ),
      ),
    );
  }
}
