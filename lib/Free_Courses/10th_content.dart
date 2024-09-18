import 'package:e_learning/Paid_Classes/View_Course/Subject/classes1.dart';
import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:e_learning/Paid_Classes/View_Course/Subject/subject_telegram_pdf.dart';

class Content10 extends StatefulWidget {
  const Content10({super.key});

  @override
  State<Content10> createState() => _Content10State();
}

class _Content10State extends State<Content10> {
  @override
  Widget build(BuildContext context) {
    final List<String> imageList2 = [
      "assets/start1.png",
      "assets/user.png",
      "assets/user.png",
      "assets/user.png",
      "assets/user.png",
      "assets/user.png",
      "assets/user.png",
      "assets/user.png",
      "assets/user.png",
      "assets/user.png",
    ];

    final List<String> headings = [
      "Telegram",
      "Biology 10th",
      "10th Class English",
      "10th Class Hindi",
      "10th Class Maths",
      "10th Class Biology",
      "10th Class Physics",
      "10th Class English(H.M.)",
      "10th Class English(H.M.)",
      "10th Class English(H.M.)",
    ];

    return Scaffold(
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
              // Handle search action
            },
            icon: const Icon(
              Icons.search,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 5,right: 5, top: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Free Courses',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400, fontFamily: 'Poppins'),
              ),
            ),
            const SizedBox(height: 15),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 0.7, // Adjusted child aspect ratio
                  mainAxisSpacing: 10,
                ),
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
                      if (headings[index] == "Biology 10th") {
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
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 70, // Set your desired width
                            height: 70, // Set your desired height
                            child: Image.asset(imageList2[index % imageList2.length]),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10.0),
                            child: SizedBox(
                              height: 30, // Control height of the widget
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
            ),
          ],
        ),
      ),
    );
  }
}
