import 'package:flutter/material.dart';
import 'package:solemne_2_dw/widgets/widgets.dart';
import 'package:provider/provider.dart';
import 'package:solemne_2_dw/service/services.dart';
import 'package:solemne_2_dw/screens/screens.dart';

class ViewProductsScreen extends StatelessWidget {
  const ViewProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productService = Provider.of<ProductService>(context);
    if (productService.isLoading) return LoadingScreen();
    return Scaffold(
      appBar: AppBarWidget(textTitle: ' LISTA DE PRODUCTOS'),
      body: ListView.builder(
        itemCount: productService.products.length,
        itemBuilder: (BuildContext context, index) => GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, 'edit_products');
          },
          child: CardProductWidget(product: productService.products[index]),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, 'create_products');
        },
      ),
    );
  }
}
