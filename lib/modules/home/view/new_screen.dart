import 'package:flutter/material.dart';

class NewScreen extends StatelessWidget {
  const NewScreen({super.key, required this.data});
  final String data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [Center(child: Text("Welcome $data"))],
      ),
    );
  }
}
