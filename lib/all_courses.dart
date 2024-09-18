import 'package:flutter/material.dart';

class AllCourses extends StatelessWidget {
  const AllCourses({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10.0), // Add padding around the entire content
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Align children to start
          children: [
            _buildCourseCard(context, 'assets/Batch.jpg', 'Ladies and Gentlemen, you could be anywhere.'),
            _buildCourseCard(context, 'assets/Batch.jpg', 'Another Course Description Here.'),
            // Add more cards as needed
          ],
        ),
      ),
    );
  }

  Widget _buildCourseCard(BuildContext context, String imagePath, String description) {
    return Card(
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
        child: Padding(
          padding: const EdgeInsets.all(10.0), // Add padding inside the card
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // Align children to start
            children: [
              Image.asset(
                imagePath,
                width: double.infinity, // Full width
                fit: BoxFit.cover, // Ensures the image fills the available space
              ),
              const SizedBox(height: 15),
              Text(
                description,
                style: const TextStyle(fontSize: 20),
              ),
              RichText(
                text: TextSpan(
                  style: DefaultTextStyle.of(context).style,
                  children: <InlineSpan>[
                    // TextSpan(
                    //   text: "You don't have the votes.\n",
                    //   style: TextStyle(color: Colors.black.withOpacity(0.6)),
                    // ),
                    WidgetSpan(
                      child: Icon(Icons.check_box, size: 18, color: Colors.green), // Add color to the icon
                    ),
                    TextSpan(
                      text: " You don't have the votes.\n",
                      style: TextStyle(color: Colors.black.withOpacity(0.6)),
                    ),
                    WidgetSpan(
                      child: Icon(Icons.check_box, size: 18, color: Colors.green), // Add color to the icon
                    ),
                    TextSpan(
                      text: " You don't have the votes.\n",
                      style: TextStyle(color: Colors.black.withOpacity(0.6)),
                    ),
                    WidgetSpan(
                      child: Icon(Icons.check_box, size: 18, color: Colors.green), // Add color to the icon
                    ),
                    TextSpan(
                      text: " You don't have the votes.\n",
                      style: TextStyle(color: Colors.black.withOpacity(0.6)),
                    ),
                    WidgetSpan(
                      child: Icon(Icons.check_box, size: 18, color: Colors.green), // Add color to the icon
                    ),
                    TextSpan(
                      text: " You don't have the votes.\n",
                      style: TextStyle(color: Colors.black.withOpacity(0.6)),
                    ),
                    TextSpan(
                      text: "  \n",
                      style: TextStyle(color: Colors.black.withOpacity(0.6)),
                    ),


                    WidgetSpan(
                      child: Icon(Icons.currency_rupee_rounded, size: 20, color: Colors.deepOrange), // Add color to the icon
                    ),
                    TextSpan(
                      text: " 799",
                      style: TextStyle(color: Colors.black,fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),

              // const SizedBox(height: 10),
              SizedBox(
                width: double.infinity, // Increase button width to full width
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CategoryView(),
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
              const SizedBox(height: 5),
              SizedBox(
                width: double.infinity, // Increase button width to full width
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CategoryView(),
                      ),
                    );
                  },
                  child: const Text(
                    "View Demo",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff16a085),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 5),
              SizedBox(
                width: double.infinity, // Increase button width to full width
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CategoryView(),
                      ),
                    );
                  },
                  child: const Text(
                    "Buy Now",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff487eb0),
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
    );
  }
}

class CategoryView extends StatelessWidget {
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Category View')),
      body: const Center(
        child: Text('This is the Category View page'),
      ),
    );
  }
}
