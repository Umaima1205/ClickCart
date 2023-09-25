import 'package:flutter/material.dart';

import 'package:myproject/widgets/bottomnavbar.dart';
import 'package:myproject/widgets/sliderscreen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return   MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SliderCarousel(),
    );
  }
}
