import 'package:flutter/material.dart';

class TabBarWidget extends StatelessWidget {
  const TabBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        initialIndex: 1,
        length: 3,
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.greenAccent,
              title: Text('Tab Bar'),
              bottom: TabBar(
                indicatorWeight: 2,
                indicatorColor: Colors.black,
                // indicatorSize: TabBarIndicatorSize.label,
                tabs: [
                  Tab(icon: Icon(Icons.home)),
                  Tab(icon: Icon(Icons.person)),
                  Tab(icon: Icon(Icons.settings)),
                ],
              ),
            ),
            body: const TabBarView(
              children: [
                Center(child: Text('Home')),
                Center(child: Text('Person')),
                Center(child: Text('Settings')),
              ],
            )));
  }
}
