import 'package:e_learning/Search/custom_search_delegate.dart';
import 'package:e_learning/Paid_Classes/View_Course/view_course_categories.dart';
import 'package:flutter/material.dart';

class ViewCourse extends StatefulWidget {
  const ViewCourse({super.key});

  @override
  State<ViewCourse> createState() => _ViewCourseState();
}

class _ViewCourseState extends State<ViewCourse> {
  int myIndex = 0;

  final List<Widget> widgetList = const [
    ViewCourseScreen1(),  // Home screen
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: widgetList[myIndex],  // Display the selected screen
      ),
      resizeToAvoidBottomInset: true,

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


    );
  }
}
