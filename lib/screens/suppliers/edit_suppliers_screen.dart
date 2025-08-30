import 'package:flutter/material.dart';
import '../../widgets/widgets.dart';

class EditSuppliersScreen extends StatelessWidget {
  const EditSuppliersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(textTitle: 'EDITAR PROVEEDOR'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Column(
            children: [SizedBox(height: 20), FormSuppliersWidget()],
          ),
        ),
      ),
    );
  }
}
