import 'package:car_drive_animation/Provider/main_sceen_animation.dart';
import 'package:car_drive_animation/Screen/MainScreen/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom Animated Car drive',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AnimationMainScreen()),
      ],
      child: MainScreen(),
    ),
    );
  }
}