import 'package:flutter/material.dart';

class AppBarCDC extends StatelessWidget implements PreferredSizeWidget{
  const AppBarCDC({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xff2EB6FC),
      automaticallyImplyLeading: true,
      title: const Text(
        'CLUBE DE COMPRA',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold, color: Colors.white,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
