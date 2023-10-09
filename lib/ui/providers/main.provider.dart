import 'package:flutter/material.dart';

class MainProvider with ChangeNotifier {
  late AnimationController _eightAnimation;

  AnimationController get eightAnimation => _eightAnimation;

  setEightAnimation(AnimationController state) {
    _eightAnimation = state;
    notifyListeners();
  }
}
