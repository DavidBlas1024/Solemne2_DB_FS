import 'package:flutter/material.dart';
import 'package:solemne_2_dw/widgets/suppliers/edit_create_supp_widget.dart';
import 'package:solemne_2_dw/widgets/widgets.dart';
import 'package:provider/provider.dart';
import 'package:solemne_2_dw/providers/providers.dart';
import 'package:solemne_2_dw/service/services.dart';

class CreateSuppliersScreen extends StatelessWidget {
  const CreateSuppliersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final suppliersService = Provider.of<SuppliersService>(context);
    return ChangeNotifierProvider(
      create: (_) => SupplierFormProvider(suppliersService.selectsupplier!),
      child: EditCreateSuppWidget(
        title: 'AGREGAR PROVEEDOR',
        suppliersService: suppliersService,
      ),
    );
  }
}
