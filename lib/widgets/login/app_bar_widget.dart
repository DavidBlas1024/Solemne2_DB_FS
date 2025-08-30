import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String textTitle;

  const AppBarWidget({super.key, required this.textTitle});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        textTitle,
        style: const TextStyle(
          fontWeight: FontWeight.w900,
          fontSize: 22,
          color: Colors.white,
          letterSpacing: 1.2,
        ),
      ),
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(9, 28, 87, 1),
              Color.fromRGBO(115, 133, 214, 1),
              Color.fromRGBO(14, 41, 110, 1),
              Color.fromRGBO(47, 47, 131, 1),
            ],
          ),
        ),
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
