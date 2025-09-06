import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solemne_2_dw/providers/providers.dart';
import 'package:solemne_2_dw/service/services.dart';
import 'package:solemne_2_dw/widgets/widgets.dart';

class CreateProductsScreen extends StatelessWidget {
  const CreateProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productService = Provider.of<ProductService>(context);

    return ChangeNotifierProvider(
      create: (_) => ProductFormProvider(productService.selectProduct!),
      child: EditCreateProductWidget(
        title: 'CREAR PRODUCTO',
        productService: productService,
      ),
    );
  }
}
