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
}
