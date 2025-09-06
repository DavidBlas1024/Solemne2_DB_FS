import 'package:flutter/material.dart';
import 'package:solemne_2_dw/models/supplier.dart';

class InfoSuppliersWidget extends StatelessWidget {
  final Listado suppliers;

  const InfoSuppliersWidget({super.key, required this.suppliers});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.only(right: 4),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: 4, top: 19),
              width: double.infinity,
              decoration: _cardDecorations(),
              child: Text(
                suppliers.providerName,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 6),
            Container(
              padding: const EdgeInsets.only(bottom: 4, top: 19),
              width: double.infinity,
              decoration: _cardDecorations(),
              child: Text(
                suppliers.providerLastName,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  BoxDecoration _cardDecorations() => BoxDecoration(
    color: Colors.white,
    borderRadius: const BorderRadius.only(
      bottomLeft: Radius.circular(5),
      bottomRight: Radius.circular(5),
    ),
    boxShadow: const [
      BoxShadow(color: Color.fromARGB(255, 4, 9, 151), offset: Offset(0, 5)),
    ],
  );
}
