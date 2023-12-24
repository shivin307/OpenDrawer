import 'package:flutter/material.dart';

class Banana extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Details for Banana"),
      ),
      body: Center(child: const Text("Banana")),
    );
  }
}