import 'package:flutter/material.dart';
import 'package:solemne_2_dw/widgets/widgets.dart';

class ViewSuppliersScreen extends StatelessWidget {
  const ViewSuppliersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarWidget(textTitle: 'PROVEEDORES'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30),
            CategExpandibleWidget(
              nameSuppliers: 'nameSuppliers',
              rutSuppliers: 'rutSuppliers',
              phoneSuppliers: 'phoneSuppliers',
              emailSuppliers: 'emailSuppliers',
              addressSuppliers: 'addressSuppliers',
            ),
            CategExpandibleWidget(
              nameSuppliers: 'nameSuppliers',
              rutSuppliers: 'rutSuppliers',
              phoneSuppliers: 'phoneSuppliers',
              emailSuppliers: 'emailSuppliers',
              addressSuppliers: 'addressSuppliers',
            ),
            CategExpandibleWidget(
              nameSuppliers: 'nameSuppliers',
              rutSuppliers: 'rutSuppliers',
              phoneSuppliers: 'phoneSuppliers',
              emailSuppliers: 'emailSuppliers',
              addressSuppliers: 'addressSuppliers',
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, 'create_suppliers');
        },
      ),
    );
  }
}
