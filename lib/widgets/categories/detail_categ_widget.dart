import 'package:flutter/material.dart';

class DetailCategWidget extends StatelessWidget {
  final String nameCateg;
  const DetailCategWidget({super.key, required this.nameCateg});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        width: double.infinity,
        height: 70,
        decoration: _cardDecorations(),
        child: Center(
          child: Text(
            nameCateg,
            style: const TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  BoxDecoration _cardDecorations() => BoxDecoration(
    color: const Color.fromARGB(255, 15, 3, 91),
    borderRadius: BorderRadius.only(
      bottomLeft: Radius.circular(25),
      bottomRight: Radius.circular(25),
    ),
    boxShadow: const [
      BoxShadow(
        color: Color.fromARGB(255, 6, 0, 32),
        offset: Offset(0, 5),
        blurRadius: 15,
      ),
    ],
  );
}
