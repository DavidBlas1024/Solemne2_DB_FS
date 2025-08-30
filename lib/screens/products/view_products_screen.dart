import 'package:flutter/material.dart';
import 'package:solemne_2_dw/widgets/widgets.dart';

class ViewProductsScreen extends StatelessWidget {
  const ViewProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final product = [
      'Productos 1',
      'Productos 2',
      'Productos 3',
      'Productos 4',
      'Productos 5',
      'Productos 6',
      'Productos 7',
      'Productos 8',
    ];

    return Scaffold(
      appBar: AppBarWidget(textTitle: ' LISTA DE PRODUCTOS'),
      body: ListView.builder(
        itemCount: product.length,
        itemBuilder: (BuildContext context, index) => GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, 'edit_products');
          },
          child: CardProductWidget(nameProduct: product[index]),
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
