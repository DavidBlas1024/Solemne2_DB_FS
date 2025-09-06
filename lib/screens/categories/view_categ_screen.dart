import 'package:flutter/material.dart';
import 'package:solemne_2_dw/widgets/widgets.dart';
import 'package:provider/provider.dart';
import 'package:solemne_2_dw/service/services.dart';
import 'package:solemne_2_dw/screens/screens.dart';
import 'package:solemne_2_dw/models/categ.dart';

class ViewCategScreen extends StatelessWidget {
  const ViewCategScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryService = Provider.of<CategService>(context);
    if (categoryService.isLoading) return LoadingScreen();
    return Scaffold(
      appBar: AppBarWidget(textTitle: 'CATEGORIAS'),
      body: ListView.builder(
        itemCount: categoryService.category.length,
        itemBuilder: (BuildContext context, index) => GestureDetector(
          onTap: () {
            categoryService.selectCategory = categoryService.category[index]
                .copy();
            Navigator.pushNamed(context, 'edit_categories');
          },
          child: CardCategWidget(category: categoryService.category[index]),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          categoryService.selectCategory = Listado(
            categorytId: 0,
            categorytName: '',
            categoryState: '',
          );
          Navigator.pushNamed(context, 'create_categories');
        },
      ),
    );
  }
}
