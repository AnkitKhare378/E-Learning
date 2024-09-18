import 'package:e_learning/All_Categories/paid_test_series.dart';
import 'package:e_learning/All_Categories/free_courses.dart';
import 'package:e_learning/All_Categories/free_weekly_test.dart';
import 'package:e_learning/All_Categories/paid_classes.dart';
import 'package:e_learning/All_Categories/pdf_class_notes.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  @override
  Widget build(BuildContext context) {
    // Define the list of images in your assets
    final List<String> imageList = [
      "assets/img1.jpg",
      "assets/img2.jpg",
      "assets/img3.jpg",
    ];

    final List<String> imageList2 = [
      "assets/PaidClasses.png",
      "assets/FreeCourses.png",
      "assets/FreeWeeklyTest.png",
      "assets/PaidTestSeries.png",
      "assets/PdfClassNotes.png",
      "assets/Books.png",
      "assets/Syllabus.png",
      "assets/TimeTable.png",
      "assets/PreviousYear.png"

    ];

    final List<String> headings = [
      "Paid Classes",
      "Free Courses",
      "Free Weekly Test",
      " Paid Test Series",
      "PDF Class Notes",
      "Books",
      "Syllabus",
      "TimeTable",
      "Previous Year",
    ];

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Column(
            children: [
              const SizedBox(height: 20),
              CarouselSlider(
                items: imageList.map((imgPath) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: const BoxDecoration(
                          color: Colors.transparent,
                        ),
                        child: Image.asset(
                          imgPath,
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  );
                }).toList(),
                options: CarouselOptions(
                  height: 180,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastEaseInToSlowEaseOut,
                ),
              ),
              const SizedBox(height: 15),
              GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 0.8, // Adjusted child aspect ratio
                  mainAxisSpacing: 10,
                ),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: headings.length,  // Match the number of headings
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      if (headings[index] == "Paid Classes") {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => PaidClasses()),
                        );
                      } else if (headings[index] == "Free Courses") {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>  FreeCourses()),
                        );
                      } else if (headings[index] == "Free Weekly Test") {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>  FreeWeeklyTest()),
                        );
                      }
                      else if (headings[index] == " Paid Test Series") {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>  PaidTestSeries()),
                        );
                      }
                      else if (headings[index] == "PDF Class Notes") {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>  PdfClassNotes()),
                        );
                      }
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 2),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black26,
                            spreadRadius: 1,
                            blurRadius: 6,
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: 70, // Set your desired width
                            height: 70, // Set your desired height
                            child: Image.asset(imageList2[index % imageList2.length]),
                          ),
                          Text(
                            headings[index], // Unique heading for each image
                            textAlign: TextAlign.center, // Center align text
                            style: const TextStyle(
                              fontSize: 14, // Set your desired font size
                              fontWeight: FontWeight.bold, // Set your desired font weight
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}


