import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Apple extends StatelessWidget {
  final String item;
  const Apple({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(item),),
      body: Container(color: Colors.red,),
    );
  }
}
