import 'package:flutter/material.dart';
import 'package:solemne_2_dw/ui/input_decorations.dart';
import 'package:provider/provider.dart';
import 'package:solemne_2_dw/providers/providers.dart';

class FormCategWidget extends StatelessWidget {
  const FormCategWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final categForm = Provider.of<CategFormProvider>(context);
    final category = categForm.category;
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 10),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        width: double.infinity,
        decoration: _cardDecorations(),
        child: Form(
          key: categForm.formkey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              TextFormField(
                initialValue: category.categorytName,
                onChanged: (value) => category.categorytName = value,
                validator: (value) {
                  if (value == null || value.length < 1) {
                    return 'El nombre es obligatorio';
                  }
                },
                decoration: InputDecorations.authInputDecoration(
                  hinText: 'Categoria',
                  labelText: 'Nombre de la Categoria',
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
