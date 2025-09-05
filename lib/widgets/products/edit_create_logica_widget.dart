import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solemne_2_dw/service/product_service.dart';
import '../../providers/providers.dart';
import 'package:solemne_2_dw/widgets/widgets.dart';

class ProductScreenBody extends StatelessWidget {
  final String title;
  final ProductService productService;

  const ProductScreenBody({
    super.key,
    required this.title,
    required this.productService,
  });

  @override
  Widget build(BuildContext context) {
    final productForm = Provider.of<ProductFormProvider>(context);

    return Scaffold(
      appBar: AppBarWidget(textTitle: title),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Column(
            children: [
              const SizedBox(height: 20),
              ImgProduct(url: productForm.product.productImage),
              const SizedBox(height: 20),
              const FormProductWidget(),
            ],
          ),
        ),
      ),

      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          if (productForm.product.productId != 0) // 👈 condicional
            FloatingActionButton(
              heroTag: 'deleteBtn',
              backgroundColor: Colors.red,
              child: const Icon(Icons.delete_forever),
              onPressed: () async {
                if (!productForm.isValidForm()) return;
                await productService.deleteProduct(
                  productForm.product,
                  context,
                );
              },
            ),
          SizedBox(width: 20),
          FloatingActionButton(
            child: Icon(Icons.save),
            onPressed: () async {
              if (!productForm.isValidForm()) return;
              await productService.editOrCreateProducts(productForm.product);
            },
            heroTag: null,
          ),
        ],
      ),
    );
  }
}
