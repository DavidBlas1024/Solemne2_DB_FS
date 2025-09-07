import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solemne_2_dw/providers/providers.dart';
import 'package:solemne_2_dw/service/services.dart';
import 'package:solemne_2_dw/ui/input_decorations.dart';

class FormLoginWidget extends StatelessWidget {
  final String textButton;
  final String pathButton;
  final int loginRegister;

  const FormLoginWidget({
    super.key,
    required this.textButton,
    required this.pathButton,
    required this.loginRegister,
  });

  @override
  Widget build(BuildContext context) {
    final LoginForm = Provider.of<LoginFormProvider>(context);
    return Form(
      key: LoginForm.formKey,
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
            onChanged: (value) => LoginForm.email = value,
            validator: (value) {
              return (value != null && value.length > 4)
                  ? null
                  : 'El usuario no puede estar vacio o menos de cuatro';
            },
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
            onChanged: (value) => LoginForm.password = value,
            validator: (value) {
              return (value != null && value.length > 4)
                  ? null
                  : 'La contraseña no puede ser vacio o menos de cuatro';
            },
          ),
          SizedBox(height: 30),

          MaterialButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(9),
            ),
            disabledColor: const Color.fromRGBO(40, 125, 167, 1),
            color: const Color.fromARGB(255, 49, 69, 137),
            elevation: 0,
            onPressed: LoginForm.isLoading
                ? null
                : () async {
                    FocusScope.of(context).unfocus();
                    final authService = Provider.of<AuthService>(
                      context,
                      listen: false,
                    );
                    if (!LoginForm.isValidForm()) return;
                    if (loginRegister == 1) {
                      final String? errorMessage = await authService.login(
                        LoginForm.email,
                        LoginForm.password,
                      );
                      if (errorMessage == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Inicio de sesión exitoso'),
                            backgroundColor: const Color.fromARGB(
                              255,
                              3,
                              24,
                              156,
                            ),
                            duration: Duration(seconds: 2),
                            behavior: SnackBarBehavior.floating,
                            margin: EdgeInsets.only(
                              bottom: 40,
                              left: 20,
                              right: 20,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        );
                        Navigator.pushNamed(context, pathButton);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('La cuenta no existe'),
                            backgroundColor: const Color.fromARGB(
                              255,
                              3,
                              24,
                              156,
                            ),
                            duration: Duration(seconds: 2),
                            behavior: SnackBarBehavior.floating,
                            margin: EdgeInsets.only(
                              bottom: 40,
                              left: 20,
                              right: 20,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        );
                      }
                    } else {
                      final String? errorMessage = await authService.createUser(
                        LoginForm.email,
                        LoginForm.password,
                      );
                      if (errorMessage == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Cuenta Creada'),
                            backgroundColor: const Color.fromARGB(
                              255,
                              3,
                              24,
                              156,
                            ),
                            duration: Duration(seconds: 2),
                            behavior: SnackBarBehavior.floating,
                            margin: EdgeInsets.only(
                              bottom: 40,
                              left: 20,
                              right: 20,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        );
                        Navigator.pushNamed(context, pathButton);
                      } else {
                        print(errorMessage);
                      }
                    }

                    LoginForm.isLoading = false;
                  },
            child: Container(
              padding: EdgeInsetsDirectional.symmetric(
                horizontal: 80,
                vertical: 10,
              ),
              child: Text(textButton, style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }
}
