import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solemne_2_dw/providers/providers.dart';
import 'package:solemne_2_dw/service/services.dart';
import 'package:solemne_2_dw/widgets/widgets.dart';

class EditCreateSuppWidget extends StatelessWidget {
  final String title;
  final SuppliersService suppliersService;

  const EditCreateSuppWidget({
    super.key,
    required this.title,
    required this.suppliersService,
  });

  @override
  Widget build(BuildContext context) {
    final supplierForm = Provider.of<SupplierFormProvider>(context);

    return Scaffold(
      appBar: AppBarWidget(textTitle: title),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Column(
            children: [SizedBox(height: 20), FormSuppliersWidget()],
          ),
        ),
      ),

      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          if (supplierForm.supplier.providerId != 0)
            FloatingActionButton(
              backgroundColor: Colors.red,
              child: const Icon(Icons.delete_forever),
              onPressed: () async {
                if (!supplierForm.isValidForm()) return;
                await suppliersService.deleteSupplier(
                  supplierForm.supplier,
                  context,
                );
                Navigator.pop(context);
              },
            ),
          SizedBox(width: 20),
          FloatingActionButton(
            child: Icon(Icons.save),
            onPressed: () async {
              print('🟢 Botón presionado');
              if (!supplierForm.isValidForm()) return;
              await suppliersService.editOrCreateSupplier(
                supplierForm.supplier,
              );
              Navigator.pop(context);
            },
            heroTag: null,
          ),
        ],
      ),
    );
  }
}
