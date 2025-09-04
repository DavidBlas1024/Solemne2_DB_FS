import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solemne_2_dw/providers/providers.dart';
import 'package:solemne_2_dw/ui/input_decorations.dart';

class FormProductWidget extends StatelessWidget {
  const FormProductWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final productForm = Provider.of<ProductFormProvider>(context);
    final product = productForm.product;
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 10),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        width: double.infinity,
        decoration: _cardDecorations(),
        child: Form(
          key: productForm.formkey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              TextFormField(
                initialValue: product.productName,
                onChanged: (value) => product.productName = value,
                validator: (value) {
                  if (value == null || value.length < 1) {
                    return 'El nombre es obligatorio';
                  }
                },
                decoration: InputDecorations.authInputDecoration(
                  hinText: 'Nombre del producto',
                  labelText: 'Nombre',
                ),
              ),
              TextFormField(
                initialValue: product.productPrice.toString(),
                onChanged: (value) {
                  if (int.tryParse(value) == null) {
                    product.productPrice = 0;
                  } else {
                    product.productPrice = int.parse(value);
                  }
                },
                decoration: InputDecorations.authInputDecoration(
                  hinText: 'Precio',
                  labelText: 'Precio',
                ),
              ),
              TextFormField(
                initialValue: product.productImage,
                onChanged: (value) => product.productImage = value,
                validator: (value) {
                  if (value == null || value.length < 1) {
                    return "La url es obligatoria";
                  }
                },
                decoration: InputDecorations.authInputDecoration(
                  hinText: 'Agregue una Url',
                  labelText: 'Url',
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
