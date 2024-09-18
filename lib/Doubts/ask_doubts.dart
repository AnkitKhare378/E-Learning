import 'package:e_learning/Doubts/All_Doubts/record_audio_sheet2.dart';
import 'package:e_learning/Doubts/record_audio_sheet.dart';
import 'package:e_learning/Search/custom_search_delegate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:permission_handler/permission_handler.dart';

class AskDoubts extends StatefulWidget {
  const AskDoubts({super.key});

  @override
  State<AskDoubts> createState() => _AskDoubtsState();
}

class _AskDoubtsState extends State<AskDoubts> {
  // Initial Selected Value
  String? valueChoose; // Nullable type

  // List of items in our dropdown menu
  final List<String> listItem = [
    'Select subject',
    'Maths',
    'English',
    'Reasoning',
  ];

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
            const SizedBox(width: 15), // Space between the image and the title
            const Text(
              'Ask Doubts',
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
              // Method to show the search bar
              showSearch(
                context: context,
                // Delegate to customize the search bar
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 40,
                width: 330, // Set the desired width
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: EdgeInsets.symmetric(horizontal: 10), // Padding inside the dropdown
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade300), // Grey border color for enabled state
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade300), // Border color when focused
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red), // Border color when there's an error
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey), // Default grey border
                    ),
                  ),
                  hint: Text(
                    "Select subject",
                    style: TextStyle(
                      color: Color(0xcb070606),
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Poppins',
                      fontSize: 14,
                    ),
                  ), // Provide hint text
                  value: valueChoose,
                  onChanged: (String? newValue) { // Nullable type
                    setState(() {
                      valueChoose = newValue;
                    });
                  },
                  items: listItem.map((String valueItem) { // Specify type for items
                    return DropdownMenuItem<String>(
                      value: valueItem,
                      child: Text(
                        valueItem,
                        style: TextStyle(
                          color: Color(0xcb070606),
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Poppins',
                          fontSize: 14,
                        ),
                      ),
                    );
                  }).toList(),
                  dropdownColor: Colors.white, // Optional: Set dropdown menu background color
                  itemHeight: 50.0, // Optional: Customize the height of dropdown items
                  isExpanded: true, // Ensures the dropdown button takes up the full width
                ),
              ),
              const SizedBox(height: 20), // Space between dropdown and text field
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade300), // Grey border for the text field
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade300), // Grey border when focused
                  ),
                  hintText: 'Explain your Doubt (Required)',
                  hintStyle: TextStyle(
                    color: Color(0xff4b4b4b),
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins',
                    fontSize: 14,
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8), // Adjust padding inside the TextField
                ),
                maxLines: 4, // Allows multiple lines
              ),
              const SizedBox(height: 15),
              Text(
                "Optional",
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xff4b4b4b),
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Poppins',
                ),
              ),
              const SizedBox(height: 20),

              // Record Audio Input

              Container(
                height: 70, // Set height for the 'Record Audio' input
                width: 330, // Set width
                decoration: BoxDecoration(
                  color: Colors.grey.shade200, // Grey box background color
                  borderRadius: BorderRadius.circular(10), // Set border radius to 10
                ),
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
                child: TextField(
                  readOnly: true, // Make the TextField read-only
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white, // White background inside the text field
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white), // White border for the text field
                      borderRadius: BorderRadius.circular(10), // Match the container's border radius
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white), // White border when focused
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: 'Record Audio',
                    hintStyle: TextStyle(
                      color: Color(0xff4b4b4b),
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Poppins',
                      fontSize: 14,
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8), // Padding inside the TextField
                    suffixIcon: Icon(Icons.mic, color: Colors.black),
                  ),
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) => RecordAudioSheet(),
                    );
                  }
                ),
              ),
              const SizedBox(height: 10),

              // Upload Image Input

              Container(
                height: 70, // Set height
                width: 330, // Set width
                decoration: BoxDecoration(
                  color: Colors.grey.shade200, // Grey box background color
                  borderRadius: BorderRadius.circular(10), // Set border radius to 10
                ),
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
                child: TextField(
                    readOnly: true,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white, // White background inside the text field
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white), // White border for the text field
                      borderRadius: BorderRadius.circular(10), // Match the container's border radius
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white), // White border when focused
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: 'Upload image',
                    hintStyle: TextStyle(
                      color: Color(0xff4b4b4b),
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Poppins',
                      fontSize: 14,
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8), // Padding inside the TextField
                    suffixIcon: Icon(Icons.upload, color: Colors.black),
                  ),
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) => RecordAudioSheet2(),
                      );
                    }
                ),
              ),

              const SizedBox(height: 10),

              // Submit Buttom
              Container(
                height: 35,
                width: 310,
                child: ElevatedButton(
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => const ViewCourse(),
                    //   ),
                    // );
                  },
                  child: const Text(
                    "Submit",
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
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
