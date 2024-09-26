import 'package:flutter/material.dart';

class MyCustomButton extends StatelessWidget {
  final Function() onClick;
  final String buttonTitle;
  final TextStyle? buttonTitleStyle;
  final TextStyle? buttonDesabledTitleStyle;
  final BoxDecoration? buttonDecoration;
  final BoxDecoration? buttonDesabledDecoration;
  final EdgeInsetsGeometry? buttonPadding;
  final EdgeInsetsGeometry? buttonMargin;
  final double? buttonHeight;
  final double? buttonWidth;
  final bool isDisabled;
  final bool isLoading;
  const MyCustomButton(
      {super.key,
      required this.onClick,
      required this.buttonTitle,
      this.buttonPadding,
      this.buttonMargin,
      this.buttonTitleStyle,
      this.buttonDesabledDecoration,
      this.buttonDesabledTitleStyle,
      this.buttonDecoration,
      this.buttonHeight,
      this.isDisabled = false,
      this.isLoading = false,
      this.buttonWidth});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (isDisabled || isLoading) ? null : onClick,
      child: Container(
        margin: buttonMargin ?? const EdgeInsets.only(left: 10),
        padding: buttonPadding ??
            const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: (isDisabled || isLoading)
            ? (buttonDesabledDecoration ??
                BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(20)))
            : (buttonDecoration ??
                BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(20))),
        child: Text(
          buttonTitle,
          style: (isDisabled || isLoading)
              ? buttonDesabledTitleStyle ??
                  const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.white)
              : buttonTitleStyle ??
                  const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
        ),
      ),
    );
  }
}
