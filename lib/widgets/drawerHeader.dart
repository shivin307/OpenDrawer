import 'package:flutter/material.dart';

import '../list/List.dart';
import 'kPositioned.dart';

DrawerHeader drawerHeader() {
  return DrawerHeader(
    child: Stack(
      clipBehavior: Clip.none,
      children: [
        customPositioned(100, 100, -30, -30, Colors.green.withOpacity(1), 100),
        customPositioned(150, 150, -50, -50, Colors.green.withOpacity(.50), 100),
        customPositioned(250, 200, 10, -75, Colors.green.withOpacity(.25), 100),
        Positioned(
          left: -15,
          top: -15,
          child: CircleAvatar(
            radius: 35,
            child: Image.network(
              "https://avatars.githubusercontent.com/u/127138018?v=4",
            ),
          ),
        ),
        Positioned(
          left: -10,
          top: 100,
          child: Text(
            "hello, ${userList[0]}",
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Builder(
          builder: (context) {
            return Positioned(
              right: 5,
              top: 5,
              child: GestureDetector(
                onTap: () => Scaffold.of(context).closeEndDrawer(),
                child: Icon(Icons.menu),
              ),
            );
          }
        ),
      ],
    ),
  );
}
