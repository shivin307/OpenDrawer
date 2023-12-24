import 'package:drawer/widgets/kPositioned.dart';
import 'package:flutter/foundation.dart';

import '../list/List.dart' show itemList, userList;
import 'package:flutter/material.dart';

class OpenDrawer extends StatefulWidget {
  const OpenDrawer({super.key});

  @override
  State<OpenDrawer> createState() => _OpenDrawerState();
}

class _OpenDrawerState extends State<OpenDrawer> with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this); // TODO: implement dispose
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (kDebugMode) {
      print(state);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Drawer Example"),
        ),
        endDrawer: Drawer(
          width: (MediaQuery.of(context).size.width) / 2,
          child: Column(
            children: [
              DrawerHeader(
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    customPositioned(
                        100, 100, -30, -30, Colors.green.withOpacity(1), 100),
                    customPositioned(
                        150, 150, -50, -50, Colors.green.withOpacity(.50), 100),
                    customPositioned(
                        250, 200, 10, -75, Colors.green.withOpacity(.25), 100),
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
                      child: Text("hello, ${userList[0]}",
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: itemList.length,
                  itemBuilder: (context, index) {
                    return ExpansionTile(
                      title: Text("${index + 1}  ${itemList[index][0]}"),
                      children: [
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: itemList[index].length - 1,
                          itemBuilder: (context, subIndex) {
                            return ListTile(
                              title: Text(
                                  itemList[index][subIndex + 1].toString()),
                            );
                          },
                        )
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        body: Center(
          child: Builder(
            builder: (context) {
              return ElevatedButton(
                  onPressed: () {
                    Scaffold.of(context).openEndDrawer();
                  },
                  child: const Text("press"));
            },
          ),
        ),
      ),
    );
  }
}
