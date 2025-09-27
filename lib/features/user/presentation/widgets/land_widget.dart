import 'package:flutter/material.dart';

class LandingWidget extends StatelessWidget {
  const LandingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 3,
      decoration: BoxDecoration(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50),
          bottomRight: Radius.circular(50),
        ),
      ),
      child: Center(
        child: Text(
          "Clean Architecture",
          style: TextStyle(fontSize: 32, color: Colors.white),
        ),
      ),
    );
  }
}
