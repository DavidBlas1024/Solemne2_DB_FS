import 'package:flutter/material.dart';
import 'package:solemne_2_dw/models/supplier.dart';

class SupplierFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formkey = new GlobalKey<FormState>();
  Listado supplier;
  SupplierFormProvider(this.supplier);

  bool isValidForm() {
    return formkey.currentState?.validate() ?? false;
  }

  bool get isNew => supplier.providerId == 0;
}
