import 'package:flutter/material.dart';
import 'package:solemne_2_dw/widgets/widgets.dart';

class CardProductWidget extends StatelessWidget {
  final String nameProduct;
  const CardProductWidget({super.key, required this.nameProduct});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
      child: Container(
        margin: EdgeInsets.only(top: 30, bottom: 10),
        width: double.infinity,
        decoration: _cardDecorations(),
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            ImgProduct(),
            DetailProduct(nameProduct: nameProduct),
            Positioned(
              top: 0,
              right: 0,
              child: PriceProduct(priceProduct: '100'),
            ),
          ],
        ),
      ),
    );
  }

  BoxDecoration _cardDecorations() => BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(25),
    boxShadow: const [
      BoxShadow(
        color: Color.fromARGB(255, 6, 0, 32),
        offset: Offset(0, 5),
        blurRadius: 15,
      ),
    ],
  );
}
