import 'package:e_learning/Free_Weekly_Test/SSC_CGL_Tier-1.dart';
import 'package:e_learning/Search/custom_search_delegate.dart';
import 'package:e_learning/Paid_Classes/View_Course/Subject/watch_class1.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class AllTestSeries extends StatefulWidget {
  @override
  State<AllTestSeries> createState() => _AllTestSeriesState();
}

class _AllTestSeriesState extends State<AllTestSeries> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 7, // Total number of test containers
        itemBuilder: (context, index) {
          final testTitles = [
            'SSC GD 2023-24 Test Series',
            'SSC CGL Mini Mock 2024',
            'SSC MTS Mini Mock 2024',
            'English Mini Mock Quiz',
            'NEET Mini Mock 2025',
            'SSC GD 2024-25',
            'SSC CPO Tier - II 2024',
          ];

          String title = testTitles[index];
          Color backgroundColor = index % 2 == 0 ? Colors.white : Colors.grey[200]!;

          // Navigate based on the title
          return GestureDetector(
            onTap: () {
              _navigateBasedOnTitle(context, title);
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

  void _navigateBasedOnTitle(BuildContext context, String title) {
    if (title == 'SSC GD 2023-24 Test Series') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SscCglTier1()),
      );
    } else if (title == 'SSC CGL Mini Mock 2024') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SscCglTier1()), // Replace with the correct page
      );
    } else if (title == 'SSC MTS Mini Mock 2024') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SscCglTier1()), // Replace with the correct page
      );
    }
    // Add navigation for other titles similarly
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
                        padding: const EdgeInsets.only(left: 10, top: 0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  height: 25,
                                  width: 90, // Increase button width
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
                                      "Buy Now",
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
                                  height: 25,
                                  width: 100, // Increase button width
                                  child: ElevatedButton(
                                    onPressed: () {
                                      // Navigator.push(
                                      //   context,
                                      //   MaterialPageRoute(
                                      //     builder: (context) => Classes1(),
                                      //   ),
                                      // );
                                    },
                                    child: const Text(
                                      "View Demo",
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.white,
                                      ),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Color(0xFFd63031),
                                      foregroundColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10,),
                            GestureDetector(
                              onTap: () {
                                // Pass the dynamic test title to the share function
                                Share.share('Check out this test: $title');
                              },

                              child: Padding(
                                padding: const EdgeInsets.only(right: 135),
                                child: Row(
                                  children: [
                                    Icon(Icons.share, size: 12, color: Colors.black), // Share Icon
                                    const SizedBox(width: 5),
                                    const Text(
                                      "Share",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'Poppins',
                                      ),
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
