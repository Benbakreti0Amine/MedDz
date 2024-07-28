
import 'package:flutter/material.dart';

import '../static/colors.dart';
import 'home/AppointementScreen.dart';
import 'home/ChatScreen.dart';
import 'home/ProfileScreen.dart';
import 'home/home_screen.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int _BottomIndex = 0;

  List<Widget> _widgetmethod() {
    return [
      HomeScreen(),
      Chatscreen(),
      Profilescreen(),
      Appointementscreen(),
    ];
  }

  List<IconData> iconList = [
    Icons.home_outlined,
    Icons.chat_outlined,
    Icons.person_outline_outlined,
    Icons.calendar_month_outlined
  ];

  List<String> titles = [
    "home",
    "favorites",
    "shop",
    "profile",
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: IndexedStack(
          index: _BottomIndex,
          children: _widgetmethod(),
        ),
        bottomNavigationBar: Container(
          padding: EdgeInsets.symmetric(horizontal: 35,vertical: 15),
          child: ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(30),
              ),
              child: AnimatedBottomNavigationBar(
                  backgroundColor: AppColors.primary,
                  splashColor: AppColors.primary,
                  activeColor: Colors.black.withOpacity(.5),
                  inactiveColor: AppColors.white,
                  icons: iconList,
                  activeIndex: _BottomIndex,
                  gapLocation: GapLocation.center,
                  notchSmoothness: NotchSmoothness.verySmoothEdge,
                  onTap: (index) {
                    setState(() {
                      _BottomIndex = index;
                    });
                  }),
            ),
        ),
        ),
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// import '../static/colors.dart';
// import 'home/AppointementScreen.dart';
// import 'home/ChatScreen.dart';
// import 'home/ProfileScreen.dart';
// import 'home/home_screen.dart';

// class RootPage extends StatefulWidget {
//   const RootPage({super.key});

//   @override
//   State<RootPage> createState() => _RootPageState();
// }

// class _RootPageState extends State<RootPage> {
//   int _bottomIndex = 0;

//   List<Widget> _widgetMethod() {
//     return [
//       HomeScreen(),
//       Chatscreen(),
//       Profilescreen(),
//       Appointementscreen(),
//     ];
//   }

//   final List<String> svgIconPaths = [
//     'assets/images/icon1.svg',
//     'assets/images/icon2.svg',
//     'assets/images/icon3.svg',
//     'assets/images/icon3.svg',
//     // 'assets/images/icon4.svg',
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal:1 ,vertical:22 ),
//       child: Scaffold(
//         body: IndexedStack(
//           index: _bottomIndex,
//           children: _widgetMethod(),
//         ),
//         bottomNavigationBar:  ClipRRect(
//             borderRadius: BorderRadius.all(
//               Radius.circular(30),),
//             child: BottomNavigationBar(
//               backgroundColor: AppColors.primary,
//               currentIndex: _bottomIndex,
//               onTap: (index) {
//                 setState(() {
//                   _bottomIndex = index;
//                 });
//               },
//               items: svgIconPaths.map((path) {
//                 return BottomNavigationBarItem(
//                   icon: SvgPicture.asset(
//                     path,
//                     width: 24,
//                     height: 24,
//                     color: Colors.black.withOpacity(0.5),
//                   ),
//                   activeIcon: SvgPicture.asset(
//                     path,
//                     width: 24,
//                     height: 24,
//                     color: AppColors.white,
//                   ),
//                   label: '',
//                 );
//               }).toList(),
//             ),
//           ),
//         ),
//     );
//   }
// }
