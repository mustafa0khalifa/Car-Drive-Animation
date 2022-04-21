import 'package:car_drive_animation/Basic/colors.dart';
import 'package:car_drive_animation/Basic/images.dart';
import 'package:car_drive_animation/Provider/main_sceen_animation.dart';
import 'package:car_drive_animation/Screen/MainScreen/animation_main_break.dart';
import 'package:car_drive_animation/Screen/MainScreen/animation_main_green.dart';
import 'package:car_drive_animation/Screen/MainScreen/animation_main_lane.dart';
import 'package:car_drive_animation/Screen/MainScreen/clock_timer.dart';
import 'package:car_drive_animation/Screen/MainScreen/road.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
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
    if (Theme.of(context).brightness == Brightness.light) {
      context.read<AnimationMainScreen>().changeToLigthMode();
    } else {
      context.read<AnimationMainScreen>().changeToBlackMode();
    }
    return Container(
      color: Colors.black,
      child: Scaffold(
        backgroundColor: context.read<AnimationMainScreen>().isLightMode
            ? Colors_MainScreen.backColorLight
            : Colors_MainScreen.backColorBlack,
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
                          color: context.read<AnimationMainScreen>().isLightMode
                              ? Colors.black
                              : Colors.white,
                        ),
                      )),
                ],
              ),
              Padding(padding: EdgeInsets.only(top: heigth * 0.075)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FlutterSwitch(
                    width: width * 0.145,
                    height: heigth * 0.044,
                    value: isSwitched,
                    activeColor: Colors.green,
                    borderRadius: 30.0,
                    showOnOff: false,
                    onToggle: (val) {
                      setState(() {
                        isSwitched = val;
                      });
                    },
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
                              color: context
                                      .read<AnimationMainScreen>()
                                      .isLightMode
                                  ? Colors_MainScreen.baseColorText
                                  : Colors_MainScreen.colorKMSwap,
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
              Stack(children: [
                context.watch<AnimationMainScreen>().isLane
                    ? Center(child: AnimationMainLane(width, heigth))
                    : SizedBox(),
                Center(
                  child: RoadMainLane(width,heigth),
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
                          height: heigth * 0.08,
                        ),
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          SvgPicture.asset(
                            Images_MainScreen.carModelDarkSmall,
                            width: width * 0.4377,
                            height: heigth * 0.149,
                          ),
                          context.watch<AnimationMainScreen>().isBreak
                              ? AnimationMainBreak(width, heigth)
                              : SizedBox(
                                  width: width * 0.3,
                                  height: heigth * 0.205,
                                ),
                        ],
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
        ),
      ),
    );
  }
}
