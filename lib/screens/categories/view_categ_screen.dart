import 'package:flutter/material.dart';
import 'package:solemne_2_dw/widgets/widgets.dart';

class ViewCategScreen extends StatelessWidget {
  const ViewCategScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final product = ['Categoria 1', 'Categoria 2', 'Categoria 3'];

    return Scaffold(
      appBar: AppBarWidget(textTitle: ' CATEGORIAS'),
      body: ListView.builder(
        itemCount: product.length,
        itemBuilder: (BuildContext context, index) => GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, 'edit_categories');
          },
          child: CardCategWidget(nameCateg: product[index]),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, 'create_categories');
        },
      ),
    );
  }
}
