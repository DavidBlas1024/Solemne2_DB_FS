import 'package:flutter/material.dart';
import 'package:solemne_2_dw/widgets/widgets.dart';

class LoginOneWidget extends StatelessWidget {
  final Widget child;
  const LoginOneWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          LoginTwoWidget(),
          SafeArea(
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 80),
              child: Icon(
                Icons.person_pin_circle_rounded,
                color: Colors.black,
                size: 120,
              ),
            ),
          ),
          child,
        ],
      ),
    );
  }
}
