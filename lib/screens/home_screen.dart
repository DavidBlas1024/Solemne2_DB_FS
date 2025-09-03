import 'package:flutter/material.dart';
import 'package:solemne_2_dw/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: EdgeInsets.only(top: 85),
          child: Column(
            children: [
              Text(
                'Menú',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 100),
              CardMenu(textButton: 'Proveedores', pathButton: 'view_suppliers'),
              SizedBox(height: 15),
              CardMenu(textButton: 'Categorías', pathButton: 'view_categories'),
              SizedBox(height: 15),
              CardMenu(textButton: 'Productos', pathButton: 'view_products'),
              SizedBox(height: 250),
              LogOutWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
