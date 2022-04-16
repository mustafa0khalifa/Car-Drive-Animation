import 'package:flutter/cupertino.dart';

class AnimationMainScreen extends ChangeNotifier{
  bool _isLane = true;
  bool _isBreak = false;
  bool _isGreen = false;


  bool get isLane => _isLane;
  bool get isBreak => _isBreak;
  bool get isGreen => _isGreen;


  void changeToBreak(){
    _isLane = false;
    _isBreak = true;
    _isGreen = false;

    notifyListeners();
  }

   void changeToGreen(){
    _isLane = false;
    _isBreak = false;
    _isGreen = true;

    notifyListeners();
  }

}