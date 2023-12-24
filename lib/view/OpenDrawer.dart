import 'package:drawer/widgets/drawerHeader.dart';
import 'package:drawer/widgets/drawerList.dart';
import 'package:flutter/foundation.dart';

import '../list/List.dart' show itemList, userList;
import 'package:flutter/material.dart';

class OpenDrawer extends StatefulWidget {
  const OpenDrawer({super.key});

  @override
  State<OpenDrawer> createState() => _OpenDrawerState();
}

class _OpenDrawerState extends State<OpenDrawer> with WidgetsBindingObserver {
  double opacityLevel = 1.0;
  double press = 0;

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
    print(itemList[0][1].toString());
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
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
              drawerHeader(),
              drawerList(),
            ],
          ),
        ),
        body: FlutterLogo(size: MediaQuery.of(context).size.height,),
      ),
    );
  }
}
