import 'package:flutter/material.dart';

class HomeButtons extends StatelessWidget {
  const HomeButtons({
    super.key,
    required this.onTap,
    required this.name,
    required this.color,
  });
  final Function() onTap;
  final String name;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15), color: color),
          child: Center(
              child: Text(
            name,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          )),
        ),
      ),
    );
  }
}
