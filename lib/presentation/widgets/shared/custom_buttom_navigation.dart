import 'package:flutter/material.dart';

class CustomButtomNavigation extends StatelessWidget {
  const CustomButtomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 0,
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.home_max_rounded), label: "inicio"),
        BottomNavigationBarItem(
            icon: Icon(Icons.label_outline), label: "categorias"),
        BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline), label: "favoritos"),
      ],
    );
  }
}
