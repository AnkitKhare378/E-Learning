import 'package:e_learning/Doubts/All_Doubts/EnglishAllDoubts/english_all_doubts.dart';
import 'package:e_learning/Doubts/All_Doubts/MathsAllDoubts/maths_all_doubts.dart';
import 'package:flutter/material.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';

class AllDoubts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 5.5),
                child: ButtonsTabBar(
                  backgroundColor: Color(0xFFd63031),
                  borderColor: Color(0xFFd63031),
                  height: 35,
                  unselectedBackgroundColor: Colors.white,
                  labelStyle: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  unselectedLabelStyle: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                  borderWidth: 1,
                  unselectedBorderColor: Colors.black12,
                  radius: 10,
                  contentPadding: EdgeInsets.symmetric(horizontal: 12), // Increases button width
                  tabs: [
                    Tab(text: 'Maths'),
                    Tab(text: 'English'),
                    Tab(text: 'Reasoning'),
                  ],
                ),
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                MathsAllDoubts(),
                EnglishAllDoubts(),
                Container(
                  color: Colors.white,
                  child: Center(child: Text('Content for Reasoning')),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

