import 'package:flutter/material.dart';
import 'package:solemne_2_dw/widgets/widgets.dart';
import 'package:solemne_2_dw/models/productos.dart';

class CardProductWidget extends StatelessWidget {
  final Listado product;
  const CardProductWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
      child: Container(
        margin: EdgeInsets.only(bottom: 40, top: 25),
        width: double.infinity,
        decoration: _cardDecorations(),
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            ImgProduct(url: product.productImage),
            DetailProduct(nameProduct: product.productName),
            Positioned(
              top: 0,
              right: 0,
              child: PriceProduct(
                priceProduct: product.productPrice.toString(),
              ),
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
