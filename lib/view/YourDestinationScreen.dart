import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class YourDestinationScreen extends StatelessWidget {
  final String item;

  YourDestinationScreen({required this.item});

  @override
  Widget build(BuildContext context) {
    // Use the 'item' parameter to customize the screen based on the selected item
    return Scaffold(
        appBar: AppBar(
          title: Text("Details for $item"),
        ),
        body: Center(child: const Text('ji'))// Your screen content goes here,
    );
  }
}
