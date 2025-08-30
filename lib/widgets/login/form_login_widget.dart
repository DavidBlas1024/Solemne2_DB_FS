import 'package:flutter/material.dart';
import 'package:solemne_2_dw/ui/input_decorations.dart';

class FormLoginWidget extends StatelessWidget {
  final String textButton;
  final String pathButton;

  const FormLoginWidget({
    super.key,
    required this.textButton,
    required this.pathButton,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          TextFormField(
            autocorrect: false,
            keyboardType: TextInputType.text,
            decoration: InputDecorations.authInputDecoration(
              hinText: 'Ingrese su correo',
              labelText: 'Email',
              prefixicon: Icons.people,
            ),
          ),
          SizedBox(height: 30),
          TextFormField(
            autocorrect: false,
            obscureText: true,
            keyboardType: TextInputType.text,
            decoration: InputDecorations.authInputDecoration(
              hinText: '******************',
              labelText: 'Password',
              prefixicon: Icons.lock_clock_outlined,
            ),
          ),
          SizedBox(height: 30),

          MaterialButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(9),
            ),
            disabledColor: const Color.fromARGB(255, 40, 125, 167),
            color: const Color.fromARGB(255, 49, 69, 137),
            child: Container(
              padding: EdgeInsetsDirectional.symmetric(
                horizontal: 80,
                vertical: 10,
              ),
              child: Text(textButton, style: TextStyle(color: Colors.white)),
            ),
            elevation: 0,
            onPressed: () => Navigator.pushNamed(context, pathButton),
          ),
        ],
      ),
    );
  }
}
