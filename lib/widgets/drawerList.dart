import 'package:drawer/list/List.dart';
import 'package:drawer/view/Apple.dart';
import 'package:drawer/view/Banana.dart';
import 'package:drawer/view/YourDestinationScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Expanded drawerList() {
  return Expanded(
      child: Column(
    children: [
      Expanded(
        child: ListView.builder(
          itemCount: itemList.length,
          itemBuilder: (context, index) {
            return ExpansionTile(
              title: Text(itemList[index][0]),
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: itemList[index].length - 1,
                  itemBuilder: (context, subIndex) {
                    return InkWell(
                      onTap: () {
                        _navigateToSelectedItem(
                            itemList[index][subIndex + 1].toString(), context);
                      },
                      child: ListTile(
                        title: Text(itemList[index][subIndex + 1].toString()),
                      ),
                    );
                  },
                )
              ],
            );
          },
        ),
      ),
    ],
  ));
}

void _navigateToSelectedItem(String selectedItem, BuildContext context) {
  final Map<String, StatelessWidget Function({required String item})>
      screenMap = {
    'Apple': ({required String item}) => Apple(item: item),
    'Banana': ({required String item}) => Banana(),
  };

  // Use the selected item to dynamically create the route
  final screenBuilder = screenMap[selectedItem];

  if (screenBuilder != null) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => screenBuilder(item: selectedItem),
      ),
    );
  } else {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => YourDestinationScreen(item: "empty"),
        ));
  }
}
