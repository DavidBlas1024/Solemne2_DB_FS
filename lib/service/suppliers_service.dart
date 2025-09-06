import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:solemne_2_dw/models/supplier.dart';

class suppliesrService extends ChangeNotifier {
  final String _baseUrl = '143.198.118.203:8100';
  final String _user = 'test';
  final String _pass = 'test2023';

  List<Listado> supplier = [];
  Listado? selectsupplier;
  bool isLoading = true;
  bool isEditCreate = true;

  suppliesrService() {
    loadsupplier();
  }

  loadsupplier() async {
    isLoading = true;
    notifyListeners();
    final url = Uri.http(_baseUrl, 'ejemplos/provider_list_rest/');
    String basicAuth = 'Basic ' + base64Encode(utf8.encode('$_user:$_pass'));
    final response = await http.get(url, headers: {'Authorization': basicAuth});
    final suppliergMap = Supplier.fromJson(response.body);
    supplier = suppliergMap.listado;
    isLoading = false;
    notifyListeners();
  }

  Future editOrCreateSupplier(Listado supplier) async {
    isEditCreate = true;
    notifyListeners();
    if (supplier.providerId == 0) {
      await this.createCategory(supplier);
    } else {
      await this.updateSupplier(supplier);
    }
    isEditCreate = false;
    notifyListeners();
  }

  Future<String> updateSupplier(Listado suppliers) async {
    final url = Uri.http(_baseUrl, 'ejemplos/provider_edit_rest/');
    String basicAuth = 'Basic ' + base64Encode(utf8.encode('$_user:$_pass'));
    final response = await http.post(
      url,
      body: suppliers.toJson(),
      headers: {
        'Authorization': basicAuth,
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    //Actulizar Listado
    final index = supplier.indexWhere(
      (element) => element.providerId == suppliers.providerId,
    );
    supplier[index] = suppliers;
    loadsupplier();
    return '';
  }

  Future createCategory(Listado suppliers) async {
    final url = Uri.http(_baseUrl, 'ejemplos/provider_add_rest/');
    String basicAuth = 'Basic ' + base64Encode(utf8.encode('$_user:$_pass'));
    final response = await http.post(
      url,
      body: suppliers.toJson(),
      headers: {
        'Authorization': basicAuth,
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    //agregar producto
    this.supplier.add(suppliers);
    loadsupplier();

    return '';
  }

  Future deleteCategory(Listado suppliers, BuildContext contex) async {
    final url = Uri.http(_baseUrl, 'ejemplos/provider_del_rest/');
    String basicAuth = 'Basic ' + base64Encode(utf8.encode('$_user:$_pass'));
    final response = await http.post(
      url,
      body: suppliers.toJson(),
      headers: {
        'authorization': basicAuth,
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    this.supplier.clear();
    loadsupplier();
    return '';
  }
}
