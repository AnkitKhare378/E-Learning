import 'package:flutter/material.dart';

class Screen3 extends StatelessWidget {
  const Screen3({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Number of tabs
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight - 10), // Reduce AppBar height
          child: Container(
            color: Colors.white,
            child: const SafeArea(
              child: TabBar(
                tabs: [
                  Tab(text: 'Courses'),
                  Tab(text: 'Test Series'),
                  // Tab(text: 'None'),
                ],
              ),
            ),
          ),
        ),
        body: const TabBarView(
          children: [
            Icon(Icons.directions_car),
            Icon(Icons.directions_transit),
            // Icon(Icons.directions_bike),
          ],
        ),
      ),
    );
  }
}
