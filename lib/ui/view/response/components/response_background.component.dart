import 'package:flutter/material.dart';
import 'package:m4_app_bola_8/data/constants.dart';
import 'package:m4_app_bola_8/ui/components/eight_ball/eight_ball.component.dart';

class ResponseBackground extends StatefulWidget {
  final Widget child;

  const ResponseBackground({
    super.key,
    required this.child,
  });

  @override
  State<ResponseBackground> createState() => _ResponseBackgroundState();
}

class _ResponseBackgroundState extends State<ResponseBackground> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Stack(children: [
      Positioned(
        bottom: 64,
        left: 32,
        child: EightBall(
          size: size.width - 64,
          color: kSecondaryColor.withAlpha(100),
        ),
      ),
      Positioned(
        bottom: 300,
        left: 10,
        child: EightBall(
          fontSize: 20,
          size: 100,
          color: kSecondaryColor.withAlpha(40),
        ),
      ),
      Positioned(
        bottom: 250,
        right: 10,
        child: EightBall(
          fontSize: 20,
          size: 100,
          color: kSecondaryColor.withAlpha(40),
        ),
      ),
      Positioned(
        bottom: 150,
        left: 10,
        child: EightBall(
          fontSize: 20,
          size: 100,
          color: kSecondaryColor.withAlpha(40),
        ),
      ),
      Positioned(
        bottom: 100,
        right: 10,
        child: EightBall(
          fontSize: 20,
          size: 100,
          color: kSecondaryColor.withAlpha(40),
        ),
      ),
      widget.child,
    ]);
  }
}
