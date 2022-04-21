import 'package:car_drive_animation/Basic/colors.dart';
import 'package:car_drive_animation/Provider/main_sceen_animation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RoadMainLane extends StatelessWidget {
  RoadMainLane(this.width, this.heigth);
  double width;
  double heigth;

  @override
  Widget build(BuildContext context) {
    return AnimatedColor(width, heigth);
  }
}

class AnimatedColor extends StatefulWidget {
  AnimatedColor(this.width, this.heigth);
  double width;
  double heigth;
  @override
  _AnimatedColorState createState() => _AnimatedColorState();
}

class _AnimatedColorState extends State<AnimatedColor> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(padding: EdgeInsets.only(left: widget.width * 0.33)),
        Transform.rotate(
          angle: 0.29,
          child: Container(
            width: widget.width * 0.015,
            height: widget.heigth * 0.33,
            decoration: BoxDecoration(
              border: Border.all(
                color: context.read<AnimationMainScreen>().isLightMode
                    ? Colors.white
                    : Colors.black,
              ),
              //color: _redColorAnimation.value,
              gradient: LinearGradient(
                colors: context.read<AnimationMainScreen>().isLightMode
                    ? [
                        Color.fromARGB(255, 73, 72, 72).withOpacity(0.3),
                        context.read<AnimationMainScreen>().isLightMode
                            ? Color.fromARGB(255, 73, 72, 72).withOpacity(0.8)
                            : Colors.white,
                        context.read<AnimationMainScreen>().isLightMode
                            ? Color.fromARGB(255, 73, 72, 72).withOpacity(0.8)
                            : Colors.white,
                        Color.fromARGB(255, 73, 72, 72).withOpacity(0.3),
                      ]
                    : [
                        Color.fromARGB(255, 231, 229, 229).withOpacity(0.1),
                        context.read<AnimationMainScreen>().isLightMode
                            ? Color.fromARGB(255, 231, 229, 229)
                                .withOpacity(0.8)
                            : Colors.white,
                        Color.fromARGB(255, 231, 229, 229).withOpacity(0.1),
                      ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
        ),
        Padding(padding: EdgeInsets.only(left: widget.width * 0.31)),
        Transform.rotate(
          angle: -0.29,
          child: Container(
            width: widget.width * 0.015,
            height: widget.heigth * 0.33,
            decoration: BoxDecoration(
              border: Border.all(
                color: context.read<AnimationMainScreen>().isLightMode
                    ? Colors.white
                    : Colors.black,
              ),
              //color: _redColorAnimation.value,
              gradient: LinearGradient(
                colors: context.read<AnimationMainScreen>().isLightMode
                    ? [
                        Color.fromARGB(255, 73, 72, 72).withOpacity(0.3),
                        context.read<AnimationMainScreen>().isLightMode
                            ? Color.fromARGB(255, 73, 72, 72).withOpacity(0.8)
                            : Colors.white,
                        context.read<AnimationMainScreen>().isLightMode
                            ? Color.fromARGB(255, 73, 72, 72).withOpacity(0.8)
                            : Colors.white,
                        Color.fromARGB(255, 73, 72, 72).withOpacity(0.3),
                      ]
                    : [
                        Color.fromARGB(255, 231, 229, 229).withOpacity(0.1),
                        context.read<AnimationMainScreen>().isLightMode
                            ? Color.fromARGB(255, 231, 229, 229)
                                .withOpacity(0.8)
                            : Colors.white,
                        Color.fromARGB(255, 231, 229, 229).withOpacity(0.1),
                      ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
        ),
        Padding(padding: EdgeInsets.only(right: widget.width * 0.33)),
      ],
    );
  }
}
