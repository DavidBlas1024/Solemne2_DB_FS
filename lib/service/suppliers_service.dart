// ignore_for_file: prefer_interpolation_to_compose_strings, unnecessary_this, unused_local_variable

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:solemne_2_dw/models/supplier.dart';

class SuppliersService extends ChangeNotifier {
  final String _baseUrl = '143.198.118.203:8100';
  final String _user = 'test';
  final String _pass = 'test2023';

  List<Listado> supplier = [];
  Listado? selectsupplier;
  bool isLoading = true;
  bool isEditCreate = true;

  SuppliersService() {
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
      await this.createSupplier(supplier);
    } else {
      await this.updateSupplier(supplier);
    }
    isEditCreate = false;
    notifyListeners();
  }

  Future<String> updateSupplier(Listado suppliers) async {
    final url = Uri.http(_baseUrl, 'ejemplos/provider_edit_rest/');
    String basicAuth = 'Basic ' + base64Encode(utf8.encode('$_user:$_pass'));

    final bodyJson = jsonEncode({
      'provider_id': suppliers.providerId,
      'provider_name': suppliers.providerName,
      'provider_last_name': suppliers.providerLastName,
      'provider_mail': suppliers.providerMail,
      'provider_state': suppliers.providerState,
    });

    final response = await http.post(
      url,
      body: bodyJson,
      headers: {
        'Authorization': basicAuth,
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    //Actualizar listado
    final index = supplier.indexWhere(
      (element) => element.providerId == suppliers.providerId,
    );
    supplier[index] = suppliers;
    loadsupplier();
    return '';
  }

  Future createSupplier(Listado suppliers) async {
    final url = Uri.http(_baseUrl, 'ejemplos/provider_add_rest/');
    String basicAuth = 'Basic ' + base64Encode(utf8.encode('$_user:$_pass'));

    final bodyJson = jsonEncode({
      'provider_name': suppliers.providerName,
      'provider_last_name': suppliers.providerLastName,
      'provider_mail': suppliers.providerMail,
      'provider_state': suppliers.providerState,
    });

    final response = await http.post(
      url,
      body: bodyJson,
      headers: {
        'Authorization': basicAuth,
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    //AGREGAR PROVEEDORES

    supplier.add(suppliers);
    loadsupplier();

    return '';
  }

  Future deleteSupplier(Listado suppliers, BuildContext contex) async {
    print('🗑️ Eliminando proveedor: ${suppliers.toJson()}');
    final url = Uri.http(_baseUrl, 'ejemplos/provider_del_rest/');
    String basicAuth = 'Basic ' + base64Encode(utf8.encode('$_user:$_pass'));
    final bodyJson = jsonEncode({'provider_id': suppliers.providerId});
    final response = await http.post(
      url,
      body: bodyJson,
      headers: {
        'Authorization': basicAuth,
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    this.supplier.clear();
    loadsupplier();
    return '';
  }
}
