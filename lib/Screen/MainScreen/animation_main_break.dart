import 'package:car_drive_animation/Basic/colors.dart';
import 'package:car_drive_animation/Provider/main_sceen_animation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AnimationMainBreak extends StatelessWidget {
  AnimationMainBreak(this.width, this.heigth);
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
  late int _active = 0;

  @override
  void initState() {
    _colorAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1500),
      reverseDuration: Duration(milliseconds: 1500),
    );
    _redColorAnimation = ColorTween(
      begin: context.read<AnimationMainScreen>().isLightMode
          ? Colors.white
          : Colors.black,
      end: Colors_MainScreen.colorAnimationBreak.withOpacity(0.5),
    ).animate(_colorAnimationController)
      ..addListener(() {
        setState(() {});
      });

    super.initState();
    _onTap();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: widget.heigth * 0.125),
      child: Container(
        width: widget.width * 0.35,
        height: widget.heigth * 0.08,
        decoration: BoxDecoration(
          border: Border.all(
            color: context.read<AnimationMainScreen>().isLightMode
                ? Colors.white
                : Colors.black,
          ),
          gradient: LinearGradient(
            colors: [
              context.read<AnimationMainScreen>().isLightMode
                  ? Colors.white
                  : Colors.black,
              _redColorAnimation.value,
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        transform: Matrix4.rotationX(0.90),
      ),
    );
  }

  void _onTap() {
    if (_active < 3) {
      print('AnimationMainBreak');
      _colorAnimationController
          .repeat(reverse: true)
          .timeout(Duration(milliseconds: 2000),
              onTimeout: () => {
                    _colorAnimationController.reset(),
                    _active++,
                    _onTap(),
                  });
    } else {
      _colorAnimationController.reset();
      context.read<AnimationMainScreen>().changeToGreen();
    }
    // _active = !_active;

    //
  }
}
