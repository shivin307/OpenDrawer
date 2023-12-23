import 'package:drawer/list/List.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OpenDrawer extends StatefulWidget {
  OpenDrawer({super.key});

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
    print(state);
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Drawer Example"),
        ),
        endDrawer: Drawer(
          width: (MediaQuery.of(context).size.width) / 2,
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
                        title: Text(itemList[index][subIndex + 1].toString()),
                      );
                    },
                  )
                ],
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
}
