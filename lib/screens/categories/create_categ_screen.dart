import 'package:flutter/material.dart';
import 'package:solemne_2_dw/widgets/widgets.dart';
import 'package:provider/provider.dart';
import 'package:solemne_2_dw/providers/providers.dart';
import 'package:solemne_2_dw/service/services.dart';

class CreateCategScreen extends StatelessWidget {
  const CreateCategScreen({super.key});

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
