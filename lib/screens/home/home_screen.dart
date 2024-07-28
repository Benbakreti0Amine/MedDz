import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:Meddz/static/colors.dart';

import '../../widgets/page_heading.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool Togglefavorite(bool isFavorated) {
      return !isFavorated;
    }

    return SafeArea(
        child: Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            width: size.width * 0.85,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 25.0,
                      backgroundColor: AppColors.primary,
                    ),
                    SizedBox(width: size.width * 0.03),
                    const Column(
                      children: [
                        Text(
                          "data",
                          style: TextStyle(color: AppColors.primary),
                        ),
                        Text("data"),
                      ],
                    ),
                  ],
                ),
                const Row(
                  children: [
                    Iconsbutton(
                      path: 'assets/images/notifi.svg',
                    ),
                    Iconsbutton(
                      path: 'assets/images/settings.svg',
                    ),
                  ],
                )
              ],
            ),
          ),
         
          Container(
            width: size.width * 0.85,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    buttonText(
                      path: 'assets/images/doc.svg',
                      txt: 'Doctors',
                    ),
                    buttonText(
                      path: 'assets/images/fav.svg',
                      txt: 'Favorite',
                    ),
                  ],
                ),
                searchField(size: size),
              ],
            ),
          ),
          SizedBox(
            height: size.height * 0.008,
          ),
          Container(
            width: size.width,
            height: size.height * 0.26,
            color: AppColors.secondary,
          ),
          SizedBox(
            height: size.height * 0.008,
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 6.0, horizontal: 35),
                  child: SizedBox(
                    width: size.width * 0.8,
                    child: DoctorCard(size: size),
                  ),
                );
              },
              itemCount: 4,
            ),
          ),
        ],
      ),
    ));
  }
}

class DoctorCard extends StatelessWidget {
  const DoctorCard({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
          color: AppColors.secondary, borderRadius: BorderRadius.circular(22)),
      width: size.width * 0.85,
      height: size.height * 0.12,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.primary,
            ),
            width: size.width * 0.15,
            height: size.height * 0.15,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              nameSpeciality(size: size),
              SizedBox(
                height: size.height * 0.005,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(children: [
                    Twoicons(
                      size: size,
                      icon: Icons.star_outline,
                      txt: '4.5',
                    ),
                    SizedBox(
                      width: size.width * 0.015,
                    ),
                    Twoicons(
                      size: size,
                      icon: Icons.rate_review_outlined,
                      txt: '50',
                    ),
                  ]),
                  SizedBox(width: size.width * 0.22),
                  Row(
                    children: [
                      IconButtonCustom(size: size, boolean: false),
                    ],
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class IconButtonCustom extends StatelessWidget {
  const IconButtonCustom({
    Key? key,
    required this.size,
    required this.boolean,
  }) : super(key: key);

  final Size size;
  final bool boolean;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 23,
      width: 23,
      child: IconButton(
        padding: EdgeInsets.zero,
        constraints: BoxConstraints(),
        icon: Icon(
          boolean ? Icons.favorite : Icons.favorite_border_outlined,
        ),
        color: AppColors.primary,
        iconSize: 17.5,
        onPressed: () {
          // setState(() {
          //   bool x = Togglefavorite(_plantList[index].isFavorated);
          //   _plantList[index].isFavorated = x;
          // });
        },
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
    );
  }
}

class Twoicons extends StatelessWidget {
  const Twoicons({
    super.key,
    required this.size,
    required this.icon,
    required this.txt,
  });

  final Size size;
  final IconData icon;
  final String txt;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 8, right: 8, top: 1),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: AppColors.primary,
            size: 15,
          ),
          SizedBox(width: size.width * 0.015),
          Text(
            txt,
            style: TextStyle(
              color: AppColors.primary,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}

class nameSpeciality extends StatelessWidget {
  const nameSpeciality({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(top: 5),
          width: size.width * 0.6,
          height: size.height * 0.06,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.white,
          ),
        ),
        Positioned(
          left: 10,
          top: 8.5,
          child: Text(
            "data",
            style: TextStyle(color: AppColors.primary),
          ),
        ),
        Positioned(
          left: 10,
          bottom: 3,
          child: Text(
            "data",
            style: TextStyle(color: Colors.black),
          ),
        ),
      ],
    );
  }
}

class searchField extends StatelessWidget {
  const searchField({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * 0.5,
      child: TextField(
        cursorColor: AppColors.primary.withOpacity(.2),
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.secondary,
          prefixIcon: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.white,
            ),
            margin: EdgeInsets.only(left: 7, right: 7),
            padding: EdgeInsets.all(6),
            child: SvgPicture.asset(
              'assets/images/settingsblack.svg',
            ),
          ),
          suffixIcon: Container(
            padding: EdgeInsets.all(8),
            child: SvgPicture.asset(
              'assets/images/search.svg',
              width: 0.5,
              height: 0.5,
            ),
          ),
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(40)),
        ),
      ),
    );
  }
}

class buttonText extends StatelessWidget {
  const buttonText({
    super.key,
    required this.path,
    required this.txt,
  });
  final String path;
  final String txt;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          SvgPicture.asset(path),
          SizedBox(
            height: 5,
          ),
          Text(txt),
        ],
      ),
    );
  }
}
