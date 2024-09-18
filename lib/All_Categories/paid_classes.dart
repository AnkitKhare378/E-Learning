import 'package:e_learning/all_courses.dart';
import 'package:e_learning/my_courses.dart';
import 'package:flutter/material.dart';

class PaidClasses extends StatelessWidget {
  const PaidClasses({super.key});

  @override
  Widget build(BuildContext context) {
    List<Tab> tabs = [
      Tab(
        child: Container(
          width: 100,
          alignment: Alignment.center,
          child: Text("My Courses"),
        ),
      ),
      Tab(
        child: Container(
          width: 100,
          alignment: Alignment.center,
          child: Text("All Courses"),
        ),
      ),
      Tab(
        child: Container(
          width: 180,
          alignment: Alignment.center,
          child: Text("Special For Bank Exam"),
        ),
      ),
      Tab(
        child: Container(
          width: 180,
          alignment: Alignment.center,
          child: Text("SSC Exam"),
        ),
      ),
      Tab(
        child: Container(
          width: 100,
          alignment: Alignment.center,
          child: Text("Defence"),
        ),
      ),
    ];

    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: const CircleAvatar(
            radius: 35,
            backgroundColor: Colors.white,
            backgroundImage: AssetImage("assets/start1.png"),
          ),
          backgroundColor: Colors.white,
          centerTitle: true,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: TabBar(
              indicatorColor: Colors.black,
              isScrollable: true,
              tabs: tabs,
            ),
          ),
        ),
        body: TabBarView(
          children: [
            MyCourses(),          // Display MyCourses for the first tab
            AllCourses(),        // Display AllCourses for the second tab
            AllCourses(), // Placeholder for the third tab
            MyCourses(),// Placeholder for the fourth tab
            MyCourses(), // Placeholder for the fifth tab
          ],
        ),
      ),
    );
  }
}
