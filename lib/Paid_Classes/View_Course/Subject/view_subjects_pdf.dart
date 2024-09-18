import 'package:e_learning/Paid_Classes/View_Course/Subject/pdf1.dart';
import 'package:flutter/material.dart';

class ViewSubjectsPDF extends StatelessWidget {
  const ViewSubjectsPDF({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child:  ListTile(
          leading: Image.asset(
            'assets/start1.png',
            height: 70, // Adjust the image height as needed
            width: 70,  // Adjust the image width as needed
            fit: BoxFit.contain,
          ),
          title: const Padding(
            padding: EdgeInsets.only(left: 70, bottom: 10),
            child: Text(
              "Telegram",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18,
                letterSpacing: 0,
              ),
            ),
          ),
          subtitle: SizedBox(
            width: 50, // Adjust the width of the button here
            child: Container(
              width: 10,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PDF(),
                    ),
                  );
                },
                child: const Text(
                  "View PDF",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFd63031),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ),
          ),
        ),
      // ),
    );
  }
}


