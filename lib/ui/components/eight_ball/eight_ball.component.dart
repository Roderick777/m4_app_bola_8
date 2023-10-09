import 'package:flutter/material.dart';
import 'package:m4_app_bola_8/ui/components/background_circle/background_circle.component.dart';
import 'package:m4_app_bola_8/ui/components/texts/custom_text.component.dart';

/// Este widget representa un visualmente una bola 8 de billar
///
class EightBall extends StatefulWidget {
  final double size;
  final Color color;
  final double fontSize;

  const EightBall({
    super.key,
    required this.size,
    required this.color,
    this.fontSize = 50,
  });

  @override
  State<EightBall> createState() => _EightBallState();
}

class _EightBallState extends State<EightBall> {
  @override
  Widget build(BuildContext context) {
    double childCircleSize = widget.size / 2;
    double leftCirclePosition = (widget.size / 2) - (childCircleSize / 2);

    return BackgroundCircle(
      color: widget.color.withAlpha(40),
      size: widget.size,
      child: Stack(
        children: [
          Positioned(
            left: leftCirclePosition,
            top: leftCirclePosition,
            child: BackgroundCircle(
              size: childCircleSize,
              color: Colors.white.withAlpha(150),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      '8',
                      style: TextStyle(
                        color: widget.color.withAlpha(100),
                        fontSize: widget.fontSize,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
