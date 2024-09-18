import 'package:e_learning/Free_Weekly_Test/SSC_CGL_Tier-1.dart';
import 'package:e_learning/Search/custom_search_delegate.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';


class FreeWeeklyTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              'Free Weekly Test',
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
      ),
      body: ListView.builder(
        itemCount: 7, // Total number of test containers
        itemBuilder: (context, index) {
          final testTitles = [
            'SSC CGL Tier - 1 2024',
            'SSC CGL Mini Mock 2024',
            'SSC MTS Mini Mock 2024',
            'English Mini Mock Quiz',
            'NEET Mini Mock 2025',
            'SSC GD 2024-25',
            'SSC CPO Tier - II 2024',
          ];

          String title = testTitles[index];
          Color backgroundColor = index % 2 == 0 ? Colors.white : Colors.grey[200]!;

          // Navigate to SscCglTier1 on 'SSC CGL Tier - 1 2024' tap
          return GestureDetector(
            onTap: () {
              if (title == 'SSC CGL Tier - 1 2024') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SscCglTier1()),
                );
              }
              else if (title == 'SSC CGL Mini Mock 2024') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SscCglTier1()),
                );
              }
              else if (title == 'SSC MTS Mini Mock 2024') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SscCglTier1()),
                );
              }
              else if (title == 'English Mini Mock Quiz') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SscCglTier1()),
                );
              }
              else if (title == 'NEET Mini Mock 2025') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SscCglTier1()),
                );
              }
              else if (title == 'SSC GD 2024-25') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SscCglTier1()),
                );
              }
              else if (title == 'SSC CPO Tier - II 2024') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SscCglTier1()),
                );
              }

            },
            child: Container(
              color: backgroundColor,
              child: buildTestContainer(context, title, 'assets/start1.png'),
            ),
          );
        },
      ),
    );
  }

  Widget buildTestContainer(BuildContext context, String title, String imagePath) {
    return Container(
      padding: EdgeInsets.all(0),
      child: Row(
        children: [
          Container(
            width: 100,
            height: 100,
            child: Image.asset(imagePath),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(top: 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10, top: 10),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Share.share('com.example.share_app'); // Pass the title to _onShare
                              },
                              child: Row(
                                children: [
                                  Icon(Icons.share, size: 15, color: Colors.black), // Share Icon
                                  const SizedBox(width: 5),
                                  const Text(
                                    "Share",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'Poppins',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
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
    );
  }
}
