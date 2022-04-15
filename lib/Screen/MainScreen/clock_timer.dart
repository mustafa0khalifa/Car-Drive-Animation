import 'package:car_drive_animation/Basic/colors.dart';
import 'package:flutter/material.dart';

class ClockTimer extends StatelessWidget {
  ClockTimer(this.width, this.heigth);
  double width;
  double heigth;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width * 0.243,
        height: heigth * 0.043,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Colors_MainScreen.clockTimerBegin,
                Colors_MainScreen.clockTimerEnd,
              ]),
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        // ignore: prefer_const_constructors
        child: Center(
          child: const Text(
            '12 : 35',
            style: TextStyle(
                fontFamily: 'Montserrat', fontSize: 18, color: Colors.white),
          ),
        ));
  }
}
