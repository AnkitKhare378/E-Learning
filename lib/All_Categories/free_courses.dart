import 'package:e_learning/Free_Courses/10th_content.dart';
import 'package:e_learning/Search/custom_search_delegate.dart';
import 'package:flutter/material.dart';

class FreeCourses extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0.0, // Adjust title spacing
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              'assets/start1.png',
              height: 40, // Adjust the height of the image as needed
              width: 40,  // Adjust the width of the image as needed
            ),
            const SizedBox(width: 30), // Space between the image and the title
            const Text(
              textAlign: TextAlign.center,
              'Free Courses',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                fontFamily: 'Poppins',
              ),
            ),
          ],
        ),
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
      body: Container(
        color: Colors.transparent, // Set background color to transparent or white
        child: GridView.builder(
          padding: EdgeInsets.all(5),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Two items per row
            crossAxisSpacing: 1, // Spacing between columns
            mainAxisSpacing: 1, // Spacing between rows
            childAspectRatio: 0.8, // Adjust the aspect ratio as needed
          ),
          itemCount: 4, // Number of items
          itemBuilder: (context, index) {
            // Define the content for each card
            String title;
            String imagePath;

            switch (index) {
              case 0:
                title = '10 Class CBSE';
                imagePath = 'assets/book.png';
                break;
              case 1:
                title = '11th Class CBSE';
                imagePath = 'assets/book.png';
                break;
              case 2:
                title = '12th Class CBSE';
                imagePath = 'assets/book.png';
                break;
              case 3:
                title = 'Banking Course';
                imagePath = 'assets/book.png';
                break;
              default:
                title = 'Course';
                imagePath = 'assets/book.png';
                break;
            }

            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Content10()),
                );
              },
              child: Card(
                elevation: 5,
                margin: EdgeInsets.all(5),
                child: Container(
                  height: 120, // Set height of the card
                  width: 120,  // Set width of the card
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        imagePath,
                        height: 150, // Set height of the image
                        width: 100,  // Set width of the image
                        fit: BoxFit.cover,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5,left: 5, right: 5),
                        child: Text(
                          title,
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

