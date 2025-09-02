import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/productos.dart';

class ProductService extends ChangeNotifier {
  final String _baseUrl = '143.198.118.203:8100';
  final String _user = 'test';
  final String _pass = 'test2023';

  List<Listado> products = [];

  bool isLoading = true;

  ProductService() {
    loadProducts();
  }

  loadProducts() async {
    isLoading = true;
    notifyListeners();
    final url = Uri.http(_baseUrl, 'ejemplos/product_list_rest/');
    String basicAuth = 'Basic ' + base64Encode(utf8.encode('$_user:$_pass'));
    final response = await http.get(url, headers: {'authorization': basicAuth});
    final productMap = Product.fromJson(response.body);
    products = productMap.listado;
    isLoading = false;
    notifyListeners();
  }
}
