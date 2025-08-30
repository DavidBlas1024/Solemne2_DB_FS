import 'package:flutter/material.dart';
import 'package:solemne_2_dw/ui/input_decorations.dart';

class FormSuppliersWidget extends StatelessWidget {
  const FormSuppliersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          TextFormField(
            initialValue: '',
            decoration: InputDecorations.authInputDecoration(
              hinText: 'nombre del proveedor',
              labelText: 'nombre',
            ),
          ),
          TextFormField(
            initialValue: '',
            decoration: InputDecorations.authInputDecoration(
              hinText: 'RUT del proveedor',
              labelText: 'RUT',
            ),
          ),
          TextFormField(
            initialValue: '',
            decoration: InputDecorations.authInputDecoration(
              hinText: 'Teléfono',
              labelText: 'Teléfono',
            ),
          ),
          TextFormField(
            initialValue: '',
            decoration: InputDecorations.authInputDecoration(
              hinText: 'Correo electrónico',
              labelText: 'Email',
            ),
          ),
          TextFormField(
            initialValue: '',
            decoration: InputDecorations.authInputDecoration(
              hinText: 'Dirección comercial',
              labelText: 'Dirección',
            ),
          ),
        ],
      ),
    );
  }
}
