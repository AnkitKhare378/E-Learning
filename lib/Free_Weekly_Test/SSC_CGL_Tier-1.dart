import 'package:e_learning/Paid_Classes/View_Course/Subject/watch_class1.dart';
import 'package:e_learning/Search/custom_search_delegate.dart';
import 'package:flutter/material.dart';

class SscCglTier1 extends StatelessWidget {
  const SscCglTier1({super.key});

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
              height: 40,
              width: 40,
            ),
            const SizedBox(width: 10), // Space between the image and the title
            const Text(
              'SSC CGL Tier-1 2024',
              style: TextStyle(
                fontSize: 15,
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
                delegate: CustomSearchDelegate(),
              );
            },
            icon: const Icon(
              Icons.search,
              color: Colors.black,
            ),
          ),
        ],
      ),

      // Body
      body: Padding(
        padding: const EdgeInsets.only(top: 0, left: 10, right: 10, bottom: 255), // Add top margin and horizontal padding
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
              width: 350,
              height: 191.5, // Reduced height for the card
              child: Padding(
                padding: const EdgeInsets.only(top: 0, left: 0, right: 0, bottom: 0), // Add padding inside the card
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start, // Align content to start
                            children: [
                              SizedBox(height: 0),
                              Text(
                                'SSC CGL Memory based 2',
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Poppins',
                                ),
                              ),
                              SizedBox(height: 15),
                              Text(
                                '100 Questions  200 Marks  60 Minutes',
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Poppins',
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: 2),
                          Image.asset(
                            'assets/start1.png',
                            width: 80,
                            fit: BoxFit.cover, // Ensures the image fills the available space
                          ),
                        ],
                      ),
                    ),

                    // Align Reattempt button to start
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start, // Align the button to the start
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const WatchClass1(),
                                ),
                              );
                            },
                            child: const Text(
                              "Reattempt",
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.white,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 5),
                    // Remove margins from the View Course button
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const WatchClass1(),
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
                        backgroundColor:  Color(0xfff1c40f),
                        foregroundColor: Colors.white,
                        minimumSize: Size(double.infinity, 50), // Full width, adjust height if needed
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
