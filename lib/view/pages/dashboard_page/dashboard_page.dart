import 'package:demo_app/view/pages/dashboard_page/widgets/custom_button.dart';
import 'package:demo_app/view/pages/dashboard_page/widgets/custom_square_box.dart';
import 'package:demo_app/view/pages/dashboard_page/widgets/white_space.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final List buttons = [
    "Left",
    "Right",
  ];
  String currentPosition = "center";
  bool isMoving = false;
  final Duration movementDuration = const Duration(seconds: 1);
  void changePosition({required String newPosition}) {
    setState(() {
      isMoving = true;
      currentPosition = newPosition;
    });
    Future.delayed(
        movementDuration,
        () => {
              setState(() {
                isMoving = false;
              })
            });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Square Movement"),
        backgroundColor: Colors.amber,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedAlign(
                duration: movementDuration, // Animation duration
                curve: Curves.easeInOut, // Animation
                alignment: currentPosition.toLowerCase() == "center"
                    ? Alignment.topCenter
                    : currentPosition.toLowerCase() == "left"
                        ? Alignment.topLeft
                        : currentPosition.toLowerCase() == "right"
                            ? Alignment.topRight
                            : Alignment.center,
                child: const CustomSquareBox(),
              ),
              const WhiteSpace(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...buttons.map((ele) => MyCustomButton(
                      isDisabled: currentPosition == ele,
                      isLoading: isMoving,
                      onClick: () {
                        changePosition(newPosition: ele);
                      },
                      buttonTitle: "To $ele"))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
