import 'package:e_learning/Search/custom_search_delegate.dart';
import 'package:flutter/material.dart';
import 'package:e_learning/Doubts.dart';
import 'package:e_learning/screen1.dart';
import 'package:e_learning/screen3.dart';
import 'package:e_learning/screen4.dart';

class CategoryView extends StatefulWidget {
  const CategoryView({super.key});

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  int myIndex = 0;

  final List<Widget> widgetList = const [
    Screen1(),  // Home screen
    Screen2(),  // Purchases screen
    Screen3(),  // Post screen
    Screen4(),  // Downloads screen
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: widgetList[myIndex],  // Display the selected screen
      ),
      resizeToAvoidBottomInset: true,
      drawer: Drawer(
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.all(15),
              height: 180,
              decoration: const BoxDecoration(color: Colors.deepOrangeAccent),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.white,
                        backgroundImage: AssetImage("assets/start1.png"),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.edit,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text("UserName",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                    ),),
                ],
              ),
            ),

            ListTile(
              title: const Text('Result'),
              onTap: () {
                // Handle tap
              },
            ),
            ListTile(
              title: const Text('Logout'),
              onTap: () {
                // Handle tap
              },
            ),

          ],
        ),
      ),
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
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            myIndex = index;  // Update the index based on the selected icon
          });
        },
        currentIndex: myIndex,
        selectedItemColor: Colors.blue,  // Highlight the selected item
        unselectedItemColor: Colors.grey,  // Dim the unselected items
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.bold, // Bold the selected label
          fontSize: 14, // Increase font size for emphasis
        ),
        unselectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.w800, // Semi-bold for unselected labels
          fontSize: 12, // Standard font size for unselected
        ),
        selectedIconTheme: const IconThemeData(
          color: Colors.blue, // Highlight the selected icon with blue color
          size: 30, // Increase the size of the selected icon
        ),
        unselectedIconTheme: const IconThemeData(
          color: Colors.grey, // Dim the unselected icons with grey color
          size: 24, // Standard size for unselected icons
        ),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.question_mark),
            label: 'Doubts',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.post_add_outlined),
            label: 'Post',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.download_for_offline),
            label: 'Downloads',
          ),
        ],
      ),

    );
  }
}
