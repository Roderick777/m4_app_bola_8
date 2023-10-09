import 'package:flutter/material.dart';
import 'package:m4_app_bola_8/data/constants.dart';

class BackgroundCircle extends StatefulWidget {
  final Color color;
  final double size;
  final Widget child;

  const BackgroundCircle({
    super.key,
    this.child = const Text(''),
    this.size = 30,
    this.color = kPrimaryColor,
  });

  @override
  State<BackgroundCircle> createState() => _BackgroundCircleState();
}

class _BackgroundCircleState extends State<BackgroundCircle> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.size,
      height: widget.size,
      decoration: BoxDecoration(
        color: widget.color,
        borderRadius: BorderRadius.circular(widget.size),
      ),
      child: widget.child,
    );
  }
}
