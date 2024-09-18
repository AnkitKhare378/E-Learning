import 'package:e_learning/Free_Weekly_Test/SSC_CGL_Tier-1.dart';
import 'package:e_learning/Paid_Classes/View_Course/Subject/pdf1.dart';
import 'package:e_learning/Search/custom_search_delegate.dart';
import 'package:e_learning/Paid_Classes/View_Course/Subject/watch_class1.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class PdfClassNotes extends StatefulWidget {
  @override
  State<PdfClassNotes> createState() => _PdfClassNotesState();
}

class _PdfClassNotesState extends State<PdfClassNotes> {
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
              'PDF Class Notes',
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
            'Learning with Ankit',
            'RWA SSC Exams',
            'Banking',
            'Teaching by RWA',
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
            height: 80,
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
                        padding: const EdgeInsets.only(left: 10, top: 0,),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  height: 30,
                                  width: 90, // Increase button width
                                  child: ElevatedButton(
                                    onPressed: () {
                                      WidgetsBinding.instance.addPostFrameCallback((_) {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => PDF()),
                                        );
                                      });
                                    },
                                    child: const Text(
                                      "View",
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.white,
                                      ),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Color(0xFFd63031),
                                      foregroundColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        // borderRadius: BorderRadius.circular(5),
                                      ),
                                    ),
                                  ),
                                ),

                              ],
                            ),
                            // SizedBox(height: 10,),
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
