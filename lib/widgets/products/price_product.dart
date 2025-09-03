import 'package:flutter/material.dart';

class PriceProduct extends StatelessWidget {
  final String priceProduct;
  const PriceProduct({super.key, required this.priceProduct});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 70,
      alignment: Alignment.center,
      decoration: _cardDecorations(),
      child: FittedBox(
        fit: BoxFit.contain,
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 10),
          child: Text(
            '\$$priceProduct',
            style: TextStyle(
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
    borderRadius: const BorderRadius.only(
      topRight: Radius.circular(10),
      bottomLeft: Radius.circular(10),
    ),
    boxShadow: const [
      BoxShadow(
        color: Color.fromARGB(255, 6, 0, 32),
        offset: Offset(0, 5),
        blurRadius: 10,
      ),
    ],
  );
}
