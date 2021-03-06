import 'package:car_drive_animation/Basic/colors.dart';
import 'package:car_drive_animation/Provider/main_sceen_animation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AnimationMainLane extends StatelessWidget {
  AnimationMainLane(this.width, this.heigth);
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

class _AnimatedColorState extends State<AnimatedColor>
    with TickerProviderStateMixin {
  late AnimationController _colorAnimationController;
  late Animation _redColorAnimation;
  late Animation _redColorAnimation2;
  late int _active = 0;

  @override
  void initState() {
    _colorAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1500),
      reverseDuration: Duration(milliseconds: 200),
    );
    _redColorAnimation = ColorTween(
      begin: context.read<AnimationMainScreen>().isLightMode
          ? Colors.white
          : Colors.black,
      end: Colors_MainScreen.colorAnimationBreak.withOpacity(0.8),
    ).animate(_colorAnimationController)
      ..addListener(() {
        setState(() {});
      });
    _redColorAnimation2 = ColorTween(
      begin: context.read<AnimationMainScreen>().isLightMode
          ? Colors.white
          : Colors.black,
      end: Colors.red.withOpacity(0.02),
    ).animate(_colorAnimationController)
      ..addListener(() {
        setState(() {});
      });

    super.initState();
    _onTap();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(padding: EdgeInsets.only(left: widget.width * 0.3340)),
        Transform.rotate(
          angle: 0.29,
          child: Container(
            width: widget.width * 0.05,
            height: widget.heigth * 0.33,
            decoration: BoxDecoration(
              border: Border.all(
                color: context.read<AnimationMainScreen>().isLightMode
                    ? Colors.white
                    : Colors.black,
              ),
              color: _redColorAnimation.value,
              gradient: LinearGradient(
                colors: [
                  _redColorAnimation2.value,
                  _redColorAnimation.value,
                  _redColorAnimation2.value,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
        ),
        Padding(padding: EdgeInsets.only(left: widget.width * 0.232)),
        Transform.rotate(
          angle: -0.29,
          child: Container(
            width: widget.width * 0.05,
            height: widget.heigth * 0.33,
            decoration: BoxDecoration(
              border: Border.all(
                color: context.read<AnimationMainScreen>().isLightMode
                    ? Colors.white
                    : Colors.black,
              ),
              color: _redColorAnimation.value,
              gradient: LinearGradient(
                colors: [
                   _redColorAnimation2.value,
                  _redColorAnimation.value,
                  _redColorAnimation2.value,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
        ),
        Padding(padding: EdgeInsets.only(right: widget.width * 0.3340)),
      ],
    );
  }

  void _onTap() {
    if (_active < 3) {
      print('AnimationMainLane');
      _colorAnimationController
          .repeat(reverse: true)
          .timeout(Duration(milliseconds: 2000),
              onTimeout: () => {
                    _colorAnimationController.reset(),
                    _active ++ ,
                    _onTap(),
                  });
    } else {
      _colorAnimationController.reset();
      context.read<AnimationMainScreen>().changeToBreak();
    }
    // _active = !_active;

    //
  }
}
