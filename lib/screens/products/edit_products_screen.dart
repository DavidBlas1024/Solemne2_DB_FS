import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solemne_2_dw/providers/providers.dart';
import 'package:solemne_2_dw/service/services.dart';
import 'package:solemne_2_dw/widgets/widgets.dart';

class EditProductsScreen extends StatelessWidget {
  const EditProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productService = Provider.of<ProductService>(context);

    return ChangeNotifierProvider(
      create: (_) => ProductFormProvider(productService.selectProduct!),
      child: _ProductScreenBody(productService: productService),
    );
  }
}

class _ProductScreenBody extends StatelessWidget {
  final ProductService productService;
  const _ProductScreenBody({super.key, required this.productService});
  @override
  Widget build(BuildContext context) {
    final productForm = Provider.of<ProductFormProvider>(context);
    return Scaffold(
      appBar: AppBarWidget(textTitle: 'EDITAR PRODUCTO'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Column(
            children: [
              SizedBox(height: 20),
              ImgProduct(),
              SizedBox(height: 20),
              FormProductWidget(),
            ],
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            child: Icon(Icons.save),
            onPressed: () async {
              if (!productForm.isValidForm()) return;
              await productService.editOrCreateProducts(productForm.product);
            },
          ),
        ],
      ),
    );
  }
}
