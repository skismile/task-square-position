import 'package:flutter/material.dart';

class WhiteSpace extends StatelessWidget {
  final double? height;
  final double? width;
  const WhiteSpace({super.key, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
    );
  }
}
