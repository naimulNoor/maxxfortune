import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'GSTab.dart';

class GSTabWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                GSTab(),
                Tab(
                  text: "2",
                ),
                Tab(
                  text: "3",
                )
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Text("1"),
              Text("Tab 2 content "),
              Text("Tab 3 content ")
            ],
          ),
        ));
  }
}
