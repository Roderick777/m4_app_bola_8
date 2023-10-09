import 'package:flutter/material.dart';
import 'package:m4_app_bola_8/data/constants.dart';
import 'package:m4_app_bola_8/ui/components/eight_ball/eight_ball.component.dart';

class HomeBackground extends StatefulWidget {
  final Widget child;
  final AnimationController animation;
  const HomeBackground({
    super.key,
    required this.child,
    required this.animation,
  });

  @override
  State<HomeBackground> createState() => _HomeBackgroundState();
}

class _HomeBackgroundState extends State<HomeBackground>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Stack(
      children: [
        Positioned(
          bottom: 64,
          left: 32,
          child: GestureDetector(
            onTap: () {
              widget.animation.forward();
            },
            child: RotationTransition(
              turns: widget.animation,
              child: EightBall(
                size: size.width > 64 ? size.width - 64 : size.width,
                color: kPrimaryColor.withAlpha(100),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 300,
          left: 10,
          child: EightBall(
            fontSize: 20,
            size: 100,
            color: kPrimaryColor.withAlpha(40),
          ),
        ),
        Positioned(
          bottom: 250,
          right: 10,
          child: EightBall(
            fontSize: 20,
            size: 100,
            color: kPrimaryColor.withAlpha(40),
          ),
        ),
        Positioned(
          bottom: 150,
          left: 10,
          child: EightBall(
            fontSize: 20,
            size: 100,
            color: kPrimaryColor.withAlpha(40),
          ),
        ),
        Positioned(
          bottom: 100,
          right: 10,
          child: EightBall(
            fontSize: 20,
            size: 100,
            color: kPrimaryColor.withAlpha(40),
          ),
        ),
        widget.child,
      ],
    );
  }
}
