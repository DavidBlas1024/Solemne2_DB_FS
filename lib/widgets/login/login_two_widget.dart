import 'package:flutter/material.dart';

class LoginTwoWidget extends StatelessWidget {
  const LoginTwoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: screenSize.height * 0.4,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color.fromRGBO(180, 190, 220, 1),
            Color.fromRGBO(100, 123, 220, 1),
            Color.fromRGBO(14, 41, 110, 1),
            Color.fromRGBO(200, 200, 210, 1),
          ],
          stops: [0.0, 0.2, 0.8, 200],
        ),
      ),
    );
  }
}
