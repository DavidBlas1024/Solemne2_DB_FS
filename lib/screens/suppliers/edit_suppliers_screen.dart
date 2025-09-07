import 'package:flutter/material.dart';
import 'package:solemne_2_dw/widgets/widgets.dart';
import 'package:provider/provider.dart';
import 'package:solemne_2_dw/providers/providers.dart';
import 'package:solemne_2_dw/service/services.dart';

class EditSuppliersScreen extends StatelessWidget {
  const EditSuppliersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final supplierService = Provider.of<SuppliersService>(context);
    return ChangeNotifierProvider(
      create: (_) => SupplierFormProvider(supplierService.selectsupplier!),
      child: EditCreateSuppWidget(
        title: 'Actualizar Proveedor',
        suppliersService: supplierService,
      ),
    );
  }
}
