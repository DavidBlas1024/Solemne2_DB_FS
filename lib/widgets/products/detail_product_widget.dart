import 'package:flutter/material.dart';

class DetailProduct extends StatelessWidget {
  final String nameProduct;
  const DetailProduct({super.key, required this.nameProduct});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.only(right: 50),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        width: double.infinity,
        height: 80,
        decoration: _cardDecorations(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              nameProduct,
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'SKU : 24',
              style: TextStyle(
                fontSize: 15,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

  BoxDecoration _cardDecorations() => BoxDecoration(
    color: Color.fromARGB(255, 15, 3, 91),
    borderRadius: const BorderRadius.only(
      topRight: Radius.circular(10),
      bottomLeft: Radius.circular(10),
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
