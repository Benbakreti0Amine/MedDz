import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Appointementscreen extends StatefulWidget {
  const Appointementscreen({super.key});

  @override
  State<Appointementscreen> createState() => _AppointementscreenState();
}

class _AppointementscreenState extends State<Appointementscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Appointements Screen'),
      ),
    );
  }
}