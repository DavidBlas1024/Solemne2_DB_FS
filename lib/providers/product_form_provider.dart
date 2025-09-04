import 'package:flutter/material.dart';
import 'package:solemne_2_dw/models/productos.dart';

class ProductFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formkey = new GlobalKey<FormState>();
  Listado product;
  ProductFormProvider(this.product);

  bool isValidForm() {
    return formkey.currentState?.validate() ?? false;
  }
}
