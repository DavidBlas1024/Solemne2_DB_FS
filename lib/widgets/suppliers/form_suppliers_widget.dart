import 'package:flutter/material.dart';
import 'package:solemne_2_dw/ui/input_decorations.dart';
import 'package:provider/provider.dart';
import 'package:solemne_2_dw/providers/providers.dart';

class FormSuppliersWidget extends StatelessWidget {
  const FormSuppliersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final supplierForm = Provider.of<SupplierFormProvider>(context);
    final supplier = supplierForm.supplier;
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          TextFormField(
            initialValue: supplier.providerMail,
            onChanged: (value) => supplier.providerMail = value,
            validator: (value) {
              if (value == null || value.length < 1) {
                return 'El correo es obligatorio';
              }
            },
            decoration: InputDecorations.authInputDecoration(
              hinText: 'Correo del Proveedor',
              labelText: 'Correo',
            ),
          ),
          TextFormField(
            initialValue: supplier.providerName,
            onChanged: (value) => supplier.providerName = value,
            validator: (value) {
              if (value == null || value.length < 1) {
                return 'El nombre es obligatorio';
              }
            },
            decoration: InputDecorations.authInputDecoration(
              hinText: 'Nombre del Proveedor',
              labelText: 'Nombre',
            ),
          ),
          TextFormField(
            initialValue: supplier.providerLastName,
            onChanged: (value) => supplier.providerLastName = value,
            validator: (value) {
              if (value == null || value.length < 1) {
                return 'El correo es obligatorio';
              }
            },
            decoration: InputDecorations.authInputDecoration(
              hinText: 'Apellidos del Proveedor',
              labelText: 'Apellidos',
            ),
          ),
        ],
      ),
    );
  }
}
