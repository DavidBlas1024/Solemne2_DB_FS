import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solemne_2_dw/providers/categ_form_provider.dart';
import 'package:solemne_2_dw/service/services.dart';
import '../../providers/providers.dart';
import 'package:solemne_2_dw/widgets/widgets.dart';

class EditCreateCategWidget extends StatelessWidget {
  final String title;
  final CategService categService;

  const EditCreateCategWidget({
    super.key,
    required this.title,
    required this.categService,
  });

  @override
  Widget build(BuildContext context) {
    final CategForm = Provider.of<CategFormProvider>(context);

    return Scaffold(
      appBar: AppBarWidget(textTitle: title),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Column(
            children: [
              const SizedBox(height: 20),
              const SizedBox(height: 20),
              const FormCategWidget(),
            ],
          ),
        ),
      ),

      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          if (CategForm.category.categorytId != 0)
            FloatingActionButton(
              backgroundColor: Colors.red,
              child: const Icon(Icons.delete_forever),
              onPressed: () async {
                if (!CategForm.isValidForm()) return;
                await categService.deleteCategory(CategForm.category, context);
                Navigator.pop(context);
              },
            ),
          SizedBox(width: 20),
          FloatingActionButton(
            child: Icon(Icons.save),
            onPressed: () async {
              if (!CategForm.isValidForm()) return;
              await categService.editOrCreateCategory(CategForm.category);
              Navigator.pop(context);
            },
            heroTag: null,
          ),
        ],
      ),
    );
  }
}
