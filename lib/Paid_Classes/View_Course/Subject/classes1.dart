import 'package:e_learning/Search/custom_search_delegate.dart';
import 'package:e_learning/Paid_Classes/View_Course/Subject/pdf1.dart';
import 'package:e_learning/Paid_Classes/View_Course/Subject/watch_class1.dart';
import 'package:flutter/material.dart';

class Classes1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const CircleAvatar(
          radius: 35,
          backgroundColor: Colors.white,
          backgroundImage: AssetImage("assets/start1.png"),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              // method to show the search bar
              showSearch(
                  context: context,
                  // delegate to customize the search bar
                  delegate: CustomSearchDelegate()
              );
            },
            icon: const Icon(
              Icons.search,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                // First Container with Image
                Container(
                  width: 100,
                  height: 100,
                  child: Image.asset('assets/start1.png'),
                ),
                SizedBox(width: 10), // Space between the two containers

                // Second Container with Column (Heading, Buttons)
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            'Classes - 01',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(height: 10), // Space between heading and buttons
                        Row(
                          children: [
                            SizedBox(
                              height: 40,
                              width: 85, // Increase button width
                              child: ElevatedButton(
                                onPressed: () {
                                  WidgetsBinding.instance.addPostFrameCallback((_) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => WatchClass1()),
                                    );
                                  });
                                },
                                child: const Text(
                                  "Watch",
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.white,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xfff1c40f),
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 5), // Space between buttons
                            SizedBox(
                              height: 40,
                              width: 100, // Increase button width
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const PDF(),
                                    ),
                                  );
                                },
                                child: const Text(
                                  "View PDF",
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.white,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xff34495e),
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}




// appBar: AppBar(
// backgroundColor: Colors.white,
// title: const CircleAvatar(
// radius: 35,
// backgroundColor: Colors.white,
// backgroundImage: AssetImage("assets/start1.png"),
// ),