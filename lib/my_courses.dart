import 'package:e_learning/Paid_Classes/view_course.dart';
import 'package:flutter/material.dart';

class MyCourses extends StatefulWidget {
  const MyCourses({super.key});

  @override
  State<MyCourses> createState() => _MyCoursesState();
}

class _MyCoursesState extends State<MyCourses> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 255), // Add top margin and horizontal padding
      child: Card(
        color: Colors.white,
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15), // Rounded corners
        ),
        elevation: 8, // Adds shadow with elevation
        shadowColor: Colors.black, // Black shadow color
        child: InkWell(
          splashColor: Colors.blueGrey,
          onTap: () {
            debugPrint('Card tapped.');
          },
          child: SizedBox(
            width: 300,
            height: 150, // Reduced height for the card
            child: Padding(
              padding: const EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10), // Add padding inside the card
              child: Column(
                children: [
                  SizedBox(height: 10,),
                  Expanded(
                    child: Image.asset(
                      'assets/Batch.jpg',
                      width: 300,
                      fit: BoxFit.cover, // Ensures the image fills the available space
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    'Ladies gentle men, you could been anywhere.',
                    style: TextStyle(fontSize: 20),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: 300, // Increase button width
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ViewCourse(),
                          ),
                        );
                      },
                      child: const Text(
                        "View Course",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFd63031),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

