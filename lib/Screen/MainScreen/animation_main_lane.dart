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
  late int _active = 0;

  @override
  void initState() {
    _colorAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1500),
      reverseDuration: Duration(milliseconds: 1500),
    );
    _redColorAnimation = ColorTween(
      begin: Colors.white70,
      end: Colors_MainScreen.colorAnimationBreak,
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
        Padding(padding: EdgeInsets.only(left: widget.width * 0.25)),
        Transform.rotate(
          angle: 0.29,
          alignment: Alignment.bottomRight,
          child: Container(
            width: 25,
            height: widget.heigth * 0.3,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              color: _redColorAnimation.value,
              gradient: LinearGradient(
                colors: [
                  Colors.white70,
                  _redColorAnimation.value,
                ],
                begin: Alignment.centerRight,
                end: Alignment.centerLeft,
              ),
            ),
          ),
        ),
        Padding(padding: EdgeInsets.only(right: widget.width * 0.23)),
        Transform.rotate(
          angle: -0.29,
          alignment: Alignment.topCenter
          ,
          child: Container(
            width: widget.width * 0.06,
            height: widget.heigth * 0.3,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              color: _redColorAnimation.value,
              gradient: LinearGradient(
                colors: [
                  Colors.white70,
                  _redColorAnimation.value,
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
          ),
        ),
        
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
    }else{
      _colorAnimationController.reset();
      context.read<AnimationMainScreen>().changeToBreak();

    }
    // _active = !_active;

    //
  }

 

}
