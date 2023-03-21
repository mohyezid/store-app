import 'package:flutter/material.dart';

class AppBarIcon extends StatelessWidget {
  final Function function;
  final IconData icon;
  const AppBarIcon({super.key, required this.function, required this.icon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        function();
      },
      child: Container(
        decoration: BoxDecoration(
            shape: BoxShape.circle, color: Theme.of(context).cardColor),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Icon(icon),
        ),
      ),
    );
  }
}
