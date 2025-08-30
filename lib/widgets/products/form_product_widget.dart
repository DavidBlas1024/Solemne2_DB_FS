import 'package:flutter/material.dart';
import 'package:solemne_2_dw/ui/input_decorations.dart';

class FormProductWidget extends StatelessWidget {
  const FormProductWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 10),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        width: double.infinity,
        decoration: _cardDecorations(),
        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              TextFormField(
                initialValue: 'Nombre del producto',
                decoration: InputDecorations.authInputDecoration(
                  hinText: 'Nombre del producto',
                  labelText: 'Nombre',
                ),
              ),
              TextFormField(
                initialValue: '1000',
                decoration: InputDecorations.authInputDecoration(
                  hinText: 'Precio',
                  labelText: 'Precio',
                ),
              ),
              TextFormField(
                initialValue: '24',
                decoration: InputDecorations.authInputDecoration(
                  hinText: 'SKU',
                  labelText: 'SKU',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  BoxDecoration _cardDecorations() => BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.only(
      bottomLeft: Radius.circular(25),
      bottomRight: Radius.circular(25),
    ),

    boxShadow: const [
      BoxShadow(color: Colors.black, offset: Offset(0, 5), blurRadius: 10),
    ],
  );
}
