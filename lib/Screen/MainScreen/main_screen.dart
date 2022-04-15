import 'package:car_drive_animation/Basic/colors.dart';
import 'package:car_drive_animation/Basic/images.dart';
import 'package:car_drive_animation/Screen/MainScreen/clock_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MainScreenState();
  }
}

class MainScreenState extends State<MainScreen> {
  bool isSwitched = true;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double heigth = MediaQuery.of(context).size.height;

    return Container(
      color: Colors_MainScreen.backColor,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(padding: EdgeInsets.only(top: heigth * 0.06)),
              ClockTimer(width, heigth),
              Padding(padding: EdgeInsets.only(top: heigth * 0.068)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Padding(padding: EdgeInsets.only(left: width * 0.072)),
                  Container(
                      width: width * 0.216,
                      child: Text(
                        'USE BRAKE',
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: Colors_MainScreen.redColorText,
                        ),
                      )),
                  Container(
                      width: width * 0.245,
                      child: Text(
                        'STAY IN LANE',
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: Colors_MainScreen.baseColorText,
                        ),
                      )),
                  Padding(padding: EdgeInsets.only(right: width * 0.072)),
                ],
              ),
              Padding(padding: EdgeInsets.only(top: heigth * 0.075)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(padding: EdgeInsets.only(left: width * 0.107)),
                  Switch(
                    value: isSwitched,
                    onChanged: (value) {
                      setState(() {
                        isSwitched = value;
                      });
                    },
                    activeTrackColor: Colors.lightGreenAccent,
                    activeColor: Colors.green,
                  ),
                  Padding(padding: EdgeInsets.only(right: width * 0.077)),
                  Column(
                    children: [
                      Container(
                          width: width * 0.289,
                          child: Text(
                            '65',
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 90,
                              fontWeight: FontWeight.w600,
                              color: Colors_MainScreen.baseColorText,
                            ),
                          )),
                      Container(
                          width: width * 0.16,
                          child: Text(
                            'km/h',
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              color: Colors_MainScreen.colorSpeedText,
                            ),
                          )),
                      SvgPicture.asset(
                        Images_MainScreen.stopSign,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
