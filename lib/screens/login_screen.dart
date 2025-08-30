import 'package:flutter/material.dart';
import '../widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginOneWidget(
        child: LoginFormWidget(
          textTitle: 'Login',
          textFinalButton: 'No tienes cuenta, registrate',
          path: 'register',
          textButton: 'Acceder',
          pathButton: 'home',
        ),
      ),
    );
  }
}
