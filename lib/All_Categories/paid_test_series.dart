import 'package:e_learning/Paid_Test_Series/all_test_series.dart';
import 'package:e_learning/Search/custom_search_delegate.dart';
import 'package:flutter/material.dart';

class PaidTestSeries extends StatelessWidget {
  const PaidTestSeries({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          titleSpacing: 0.0, // Adjust title spacing
          backgroundColor: Colors.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                'assets/start1.png',
                height: 40,
                width: 40,
              ),
              const SizedBox(width: 15), // Space between the image and the title
              const Text(
                'Paid Test Series',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Poppins',
                ),
              ),
            ],
          ),
          actions: [
            IconButton(
              onPressed: () {
                // method to show the search bar
                showSearch(
                  context: context,
                  // delegate to customize the search bar
                  delegate: CustomSearchDelegate(),
                );
              },
              icon: const Icon(
                Icons.search,
                color: Colors.black,
              ),
            ),
          ],
          bottom: const TabBar(
            tabs: [
              Tab(text: 'All Test Series'),
              Tab(text: 'My Test Series'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            AllTestSeries(), // Ensure this widget is properly implemented and imported
            Icon(Icons.directions_transit),
          ],
        ),
      ),
    );
  }
}
