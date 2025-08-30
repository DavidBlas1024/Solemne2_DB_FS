import 'package:flutter/material.dart';

class LoginCardWidget extends StatelessWidget {
  final Widget child;
  const LoginCardWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 100),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(30),
        decoration: _cardDecoration(),
        child: child,
      ),
    );
  }
}

BoxDecoration _cardDecoration() => BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.circular(25),
  boxShadow: const [
    BoxShadow(
      color: Color.fromARGB(255, 27, 4, 110),
      blurRadius: 15,
      offset: Offset(0, 10),
    ),
  ],
);
