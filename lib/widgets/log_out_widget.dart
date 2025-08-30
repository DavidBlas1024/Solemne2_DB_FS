import 'package:flutter/material.dart';

class LogOutWidget extends StatelessWidget {
  const LogOutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Padding(
        padding: EdgeInsets.only(left: 25, bottom: 50),
        child: Row(
          children: [
            Container(
              width: 58,
              height: 58,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 183, 178, 178),
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: Icon(Icons.logout, color: Colors.black),
                iconSize: 46,
                tooltip: 'Cerrar sesión',
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
