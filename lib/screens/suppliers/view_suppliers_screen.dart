import 'package:flutter/material.dart';
import 'package:solemne_2_dw/models/supplier.dart';
import 'package:solemne_2_dw/widgets/widgets.dart';
import 'package:solemne_2_dw/service/services.dart';
import 'package:solemne_2_dw/screens/screens.dart';
import 'package:provider/provider.dart';

class ViewSuppliersScreen extends StatelessWidget {
  const ViewSuppliersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final suplliersService = Provider.of<SuppliersService>(context);
    if (suplliersService.isLoading) return LoadingScreen();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarWidget(textTitle: 'PROVEEDORES'),
      body: ListView.builder(
        itemCount: suplliersService.supplier.length,
        itemBuilder: (BuildContext context, index) => GestureDetector(
          child: CategExpandibleWidget(
            suppliers: suplliersService.supplier[index],
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          suplliersService.selectsupplier = Listado(
            providerId: 0,
            providerName: '',
            providerLastName: '',
            providerEmail: '',
            providerState: '',
          );
          Navigator.pushNamed(context, 'create_suppliers');
        },
      ),
    );
  }
}
