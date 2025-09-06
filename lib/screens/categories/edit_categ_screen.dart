import 'package:flutter/material.dart';
import 'package:solemne_2_dw/widgets/categories/edit_create_categ_widget.dart';
import 'package:solemne_2_dw/widgets/widgets.dart';
import 'package:solemne_2_dw/providers/providers.dart';
import 'package:solemne_2_dw/service/services.dart';
import 'package:provider/provider.dart';

class EditCategScreen extends StatelessWidget {
  const EditCategScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categService = Provider.of<CategService>(context);

    return ChangeNotifierProvider(
      create: (_) => CategFormProvider(categService.selectCategory!),
      child: EditCreateCategWidget(
        title: 'EDITAR PRODUCTO',
        categService: categService,
      ),
    );
  }
}
