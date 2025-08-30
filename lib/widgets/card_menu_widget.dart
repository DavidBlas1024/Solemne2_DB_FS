import 'package:flutter/material.dart';

class CardMenu extends StatelessWidget {
  final String textButton;
  final String pathButton;
  const CardMenu({
    super.key,
    required this.textButton,
    required this.pathButton,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: double.infinity,
        child: MaterialButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          color: const Color.fromARGB(255, 16, 2, 92),
          elevation: 10,
          onPressed: () => Navigator.pushNamed(context, pathButton),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Text(
              textButton,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
