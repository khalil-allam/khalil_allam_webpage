import 'package:allam_challenge_webpage/color_pallete.dart';
import 'package:flutter/material.dart';

import 'website_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Khalil',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: secondGreenColor),
        useMaterial3: true,
      ),
      home: const KhalilWebPage(),
    );
  }
}
