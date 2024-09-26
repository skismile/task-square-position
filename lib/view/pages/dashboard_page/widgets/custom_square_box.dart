import 'package:flutter/material.dart';

class CustomSquareBox extends StatelessWidget {
  const CustomSquareBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      decoration: const BoxDecoration(color: Colors.red),
    );
  }
}
