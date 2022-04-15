import 'package:car_drive_animation/Screen/MainScreen/main_screen.dart';
import 'package:flutter/material.dart';

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
      home: MainScreen(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Body(),
      color: Colors.white,
    );
  }
}

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  double width = MediaQuery.of(context).size.width;
  double heigth = MediaQuery.of(context).size.height;
    return SingleChildScrollView(child: 
    Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Padding(padding: EdgeInsets.only(top: heigth*0.06)),
        Padding(padding: EdgeInsets.only(top: heigth*0.068)),
      ],
      ),);
  }
}


class AnimatedIconButton extends StatefulWidget {
  @override
  _AnimatedIconButtonState createState() => _AnimatedIconButtonState();
}

class _AnimatedIconButtonState extends State<AnimatedIconButton>
    with TickerProviderStateMixin {
  late AnimationController _colorAnimationController;
  late Animation _backgroundColorAnimation;
  late bool _active = false;

  @override
  void initState() {
    _colorAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1500),
      reverseDuration: Duration(milliseconds: 1500),
 
    );
    _backgroundColorAnimation = ColorTween(
      begin: Colors.white,
      end: Colors.black,
    ).animate(_colorAnimationController)
      ..addListener(() {
        setState(() {});
      });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      onDoubleTap: _onDoubleTap,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            border: Border.all(color: Colors.black),
            color: _backgroundColorAnimation.value),
      ),
    );
  }

 void _onDoubleTap(){
   _active = true;
   _colorAnimationController.reset();
 }

 void _onTap()  {
   _active= false;
       if(!_active){
          print('_onTap');
        _colorAnimationController.repeat(reverse: true)
        .timeout( Duration(milliseconds: 6000),
        onTimeout: () => {
          _colorAnimationController.reset(),
          _onTap2(),
        });
      }
     // _active = !_active; 

      
      //
      
  }

 void _onTap2()  {
   if(!_active){
     print('_onTap2');
        _colorAnimationController.repeat(reverse: true)
        .timeout( Duration(milliseconds: 6000),
        onTimeout: () => {
          _colorAnimationController.reset(),
          _onTap(),
        });
   }
         
      }

      
      //
     
}
