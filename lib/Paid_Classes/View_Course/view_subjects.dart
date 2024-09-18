import 'package:e_learning/Paid_Classes/View_Course/Subject/classes1.dart';
import 'package:e_learning/Paid_Classes/View_Course/Subject/subject_telegram_pdf.dart';
import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

class ViewSubjects extends StatefulWidget {
  const ViewSubjects({super.key});

  @override
  State<ViewSubjects> createState() => _ViewSubjectsState();
}

class _ViewSubjectsState extends State<ViewSubjects> {
  @override
  Widget build(BuildContext context) {
    final List<String> imageList2 = [
      "assets/start1.png",
      "assets/user.png",
      "assets/user.png",
    ];
    final List<String> headings = [
      "Telegram",
      "English By Sanjeev Sir",
      "Sanjeev Sir Worksheet",
    ];

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Column(
            children: [
              const SizedBox(height: 15),
              GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 0.7, // Adjusted child aspect ratio
                  mainAxisSpacing: 10,
                ),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: imageList2.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      if (headings[index] == "Telegram") {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const TelegramPDF()),
                        );
                      }
                      else if (headings[index] == "English By Sanjeev Sir") {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Classes1()),
                        );
                      }
                      else if (headings[index] == "Sanjeev Sir Worksheet") {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Classes1()),
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
                          // Conditionally display Marquee or Text based on heading length
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 13.0),
                            child: SizedBox(
                              height: 20, // Control height of the widget
                              child: headings[index].length > 10
                                  ? Marquee(
                                text: headings[index], // Use index to access headings list
                                style: const TextStyle(fontWeight: FontWeight.bold),
                                scrollAxis: Axis.horizontal,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                blankSpace: 30.0,
                                velocity: 50.0,
                                pauseAfterRound: const Duration(seconds: 1),
                                startPadding: 10.0,
                                accelerationDuration: const Duration(seconds: 1),
                                accelerationCurve: Curves.linear,
                                decelerationDuration: const Duration(milliseconds: 500),
                                decelerationCurve: Curves.easeOut,
                              )
                                  : Text(
                                headings[index], // Regular text for shorter headings
                                style: const TextStyle(fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
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
