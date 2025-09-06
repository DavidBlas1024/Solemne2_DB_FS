import 'package:flutter/material.dart';
import 'package:solemne_2_dw/models/categ.dart';

class CategFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formkey = new GlobalKey<FormState>();
  Listado category;
  CategFormProvider(this.category);

  bool isValidForm() {
    return formkey.currentState?.validate() ?? false;
  }

  bool get isNew => category.categorytId == 0;
}
