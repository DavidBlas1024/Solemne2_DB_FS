import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:solemne_2_dw/models/categ.dart';

class CategService extends ChangeNotifier {
  final String _baseUrl = '143.198.118.203:8100';
  final String _user = 'test';
  final String _pass = 'test2023';

  List<Listado> category = [];
  Listado? selectCategory;
  bool isLoading = true;
  bool isEditCreate = true;

  CategService() {
    loadCategory();
  }

  loadCategory() async {
    isLoading = true;
    notifyListeners();
    final url = Uri.http(_baseUrl, 'ejemplos/category_list_rest/');
    String basicAuth = 'Basic ' + base64Encode(utf8.encode('$_user:$_pass'));
    final response = await http.get(url, headers: {'Authorization': basicAuth});
    final categMap = Categ.fromJson(response.body);
    category = categMap.listado;
    isLoading = false;
    notifyListeners();
  }

  Future editOrCreateCategory(Listado category) async {
    isEditCreate = true;
    notifyListeners();
    if (category.categorytId == 0) {
      await this.createCategory(category);
    } else {
      await this.updateCategory(category);
    }
    isEditCreate = false;
    notifyListeners();
  }

  Future<String> updateCategory(Listado product) async {
    final url = Uri.http(_baseUrl, 'ejemplos/category_edit_rest/');
    String basicAuth = 'Basic ' + base64Encode(utf8.encode('$_user:$_pass'));
    final response = await http.post(
      url,
      body: product.toJson(),
      headers: {
        'Authorization': basicAuth,
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    //Actulizar Listado
    final index = category.indexWhere(
      (element) => element.categorytId == product.categorytId,
    );
    category[index] = product;
    loadCategory();
    return '';
  }

  Future createCategory(Listado product) async {
    final url = Uri.http(_baseUrl, 'ejemplos/category_add_rest/');
    String basicAuth = 'Basic ' + base64Encode(utf8.encode('$_user:$_pass'));
    final response = await http.post(
      url,
      body: product.toJson(),
      headers: {
        'Authorization': basicAuth,
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    //agregar producto
    this.category.add(product);
    loadCategory();

    return '';
  }

  Future deleteCategory(Listado product, BuildContext contex) async {
    final url = Uri.http(_baseUrl, 'ejemplos/category_del_rest/');
    String basicAuth = 'Basic ' + base64Encode(utf8.encode('$_user:$_pass'));
    final response = await http.post(
      url,
      body: product.toJson(),
      headers: {
        'authorization': basicAuth,
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    this.category.clear();
    loadCategory();
    return '';
  }
}
