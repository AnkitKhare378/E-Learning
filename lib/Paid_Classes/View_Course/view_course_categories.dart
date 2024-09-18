import 'package:e_learning/Paid_Classes/View_Course/view_subjects.dart';
import 'package:e_learning/all_courses.dart';
import 'package:e_learning/my_courses.dart';
import 'package:flutter/material.dart';


class ViewCourseScreen1 extends StatelessWidget {
  const ViewCourseScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Number of tabs
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight - 10), // Reduce AppBar height
          child: Container(
            color: Colors.white,
            child: const SafeArea(
              child: TabBar(
                tabs: [
                  Tab(text: 'Subjects'),
                  Tab(text: 'Live'),
                  Tab(text: 'Telegram'),
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            ViewSubjects(),          // Display MyCourses for the first tab
            AllCourses(),        // Display AllCourses for the second tab
            AllCourses(), // Placeholder for the third tab
             // Placeholder for the fifth tab
          ],
        ),
      ),
    );
  }
}
