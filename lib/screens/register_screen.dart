import 'package:flutter/material.dart';
import '../widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginOneWidget(
        child: LoginFormWidget(
          textTitle: 'Registro',
          textFinalButton: '¿Tienes cuenta?, accede aqui',
          path: 'login',
          textButton: 'Registrar',
          pathButton: 'error', //falta consumir el servicio
        ),
      ),
    );
  }
}
