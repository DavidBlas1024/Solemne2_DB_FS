import 'package:flutter/material.dart';
import 'package:solemne_2_dw/widgets/widgets.dart';

class CreateCategScreen extends StatelessWidget {
  const CreateCategScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(textTitle: 'EDITAR CATEGORIA'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Column(
            children: [
              SizedBox(height: 20),
              ImgProduct(),
              SizedBox(height: 20),
              FormCategWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
