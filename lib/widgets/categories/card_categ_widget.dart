import 'package:flutter/material.dart';
import 'package:solemne_2_dw/widgets/widgets.dart';

class CardCategWidget extends StatelessWidget {
  final String nameCateg;
  const CardCategWidget({super.key, required this.nameCateg});

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
            DetailCategWidget(nameCateg: nameCateg),
          ],
        ),
      ),
    );
  }

  BoxDecoration _cardDecorations() => BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(25),
    boxShadow: const [
      BoxShadow(color: Colors.black, offset: Offset(0, 5), blurRadius: 10),
    ],
  );
}
