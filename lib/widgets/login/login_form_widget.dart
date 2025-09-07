import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solemne_2_dw/providers/login_form_provider.dart';
import 'package:solemne_2_dw/widgets/widgets.dart';

class LoginFormWidget extends StatelessWidget {
  final String textTitle;
  final String textFinalButton;
  final String path;
  final String textButton;
  final String pathButton;
  final int loginRegister;

  const LoginFormWidget({
    super.key,
    required this.textTitle,
    required this.textFinalButton,
    required this.path,
    required this.textButton,
    required this.pathButton,
    required this.loginRegister,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 150),
          LoginCardWidget(
            child: Column(
              children: [
                SizedBox(height: 10),
                Text(
                  textTitle,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                SizedBox(height: 30),
                ChangeNotifierProvider(
                  create: (_) => LoginFormProvider(),
                  child: FormLoginWidget(
                    textButton: textButton,
                    pathButton: pathButton,
                    loginRegister: loginRegister,
                  ),
                ),

                SizedBox(height: 10),
                TextButton(
                  child: Text(textFinalButton),
                  onPressed: () => Navigator.pushNamed(context, path),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
