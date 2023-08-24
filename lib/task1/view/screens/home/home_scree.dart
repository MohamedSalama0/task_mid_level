import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  // final TabController _tabController = TabController(length: 2, vsync: );

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            indicatorSize: TabBarIndicatorSize.label,
            tabs: [
              Tab(icon: Icon(Icons.home), text: 'home'),
              Tab(
                icon: Icon(Icons.person),
                text: 'profile',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Center(
              child: Container(
                  padding: const EdgeInsets.all(15),
                  color: Colors.blueGrey,
                  child: const Text('home')),
            ),
            Center(
              child: Container(
                  padding: const EdgeInsets.all(15),
                  color: Colors.cyan,
                  child: const Text('profile')),
            ),
          ],
          // controller: ,
        ),
      ),
    );
  }
}
