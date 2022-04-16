import 'package:car_drive_animation/Basic/colors.dart';
import 'package:car_drive_animation/Basic/images.dart';
import 'package:car_drive_animation/Provider/main_sceen_animation.dart';
import 'package:car_drive_animation/Screen/MainScreen/animation_main_break.dart';
import 'package:car_drive_animation/Screen/MainScreen/animation_main_green.dart';
import 'package:car_drive_animation/Screen/MainScreen/animation_main_lane.dart';
import 'package:car_drive_animation/Screen/MainScreen/clock_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

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
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
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
                ],
              ),
              Padding(padding: EdgeInsets.only(top: heigth * 0.075)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
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
                    ],
                  ),
                  SvgPicture.asset(
                    Images_MainScreen.stopSign,
                    width: width * 0.218,
                    height: heigth * 0.109,
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.only(top: heigth * 0.029)),
              Stack(
                children: [
                  Center(child: AnimationMainLane(width, heigth)),
                  Stack(children: [
                    Center(
                      child: SvgPicture.asset(
                        Images_MainScreen.road,
                        width: width * 0.591,
                        height: heigth * 0.312,
                      ),
                    ),
                    Center(
                      child: context.watch<AnimationMainScreen>().isGreen
                          ? Padding(
                              padding: EdgeInsets.only(top: heigth * 0.06),
                              child: Container(
                                width: width * 0.09,
                                height: heigth * 0.25,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.white),
                                  color: Colors_MainScreen.colorAnimationGreen,
                                ),
                              ),
                            )
                          : SizedBox(
                              width: width * 0.394,
                              height: heigth * 0.06,
                            ),
                    ),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SvgPicture.asset(
                            Images_MainScreen.carModelDarkSmall,
                            width: width * 0.304,
                            height: heigth * 0.104,
                          ),
                          context.watch<AnimationMainScreen>().isBreak
                              ? AnimationMainBreak(width, heigth)
                              : SizedBox(
                                  width: width * 0.394,
                                  height: heigth * 0.06,
                                ),
                          SvgPicture.asset(
                            Images_MainScreen.carModelLightLarg,
                            width: width * 0.669,
                            height: heigth * 0.228,
                          ),
                        ],
                      ),
                    )
                  ]),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
