import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OpenDrawer extends StatelessWidget {
  OpenDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("drawer"),
        ),
        endDrawer: Drawer(
          child: ListView.builder(
            itemCount: itemList.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(itemList[index].toString()),
              );
            },
          ),
        ),
        body: Center(
          child: Builder(
            builder: (context) {
              return ElevatedButton(
                  onPressed: () {
                    Scaffold.of(context).openEndDrawer();
                  },
                  child: Text("press"));
            },
          ),
        ),
      ),
    );
  }

  List<String> itemList = [
    "item1",
    "item2",
    "item3",
    "item4",
    "item5",
    "item6",
    "item7",
    "item8",
  ];
}
