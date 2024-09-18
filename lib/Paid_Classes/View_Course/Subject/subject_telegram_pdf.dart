import 'package:e_learning/Paid_Classes/View_Course/Subject/view_subjects_pdf.dart';
import 'package:e_learning/Search/custom_search_delegate.dart';
import 'package:flutter/material.dart';
import 'package:e_learning/Doubts.dart';


class TelegramPDF extends StatefulWidget {
  const TelegramPDF({super.key});

  @override
  State<TelegramPDF> createState() => _TelegramPDFState();
}

class _TelegramPDFState extends State<TelegramPDF> {
  int myIndex = 0;

  final List<Widget> widgetList = const [
    Screen2(),  // Home screen
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ViewSubjectsPDF(),  // Display the selected screen
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
