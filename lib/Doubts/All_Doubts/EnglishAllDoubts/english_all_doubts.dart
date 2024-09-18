import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class EnglishAllDoubts extends StatefulWidget {
  @override
  _EnglishAllDoubtsState createState() => _EnglishAllDoubtsState();
}

class _EnglishAllDoubtsState extends State<EnglishAllDoubts> {
  bool isLiked = false; // Variable to track like status

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // User
            Container(
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Container(
                      width: 50,
                      height: 50,
                      child: Image.asset("assets/user.png"),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(top: 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              "UserName",
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.blue,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Poppins',
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 6, top: 0),
                                child: GestureDetector(
                                  onTap: () {
                                    // Share functionality
                                  },
                                  child: Row(
                                    children: [
                                      const SizedBox(width: 5),
                                      const Text(
                                        "English - 541",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 10,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: 'Poppins',
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10), // Space between the new container and the main content

            // Main content
            Padding(
              padding: const EdgeInsets.only(left: 17),
              child: Text(
                'This is a sample post description. Add the content of the post here!',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 10),

            // Post Image
            Padding(
              padding: const EdgeInsets.only(left: 17, right: 17),
              child: Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: NetworkImage(
                      'https://www.missiontools.org/wp-content/uploads/B4-U3-433x432.jpg',
                    ), // Replace with actual image URL
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),

            // Number of Likes and Comments
            Padding(
              padding: const EdgeInsets.only(left: 17, bottom: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    '23 likes',
                    style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(width: 15),
                  Text(
                    '7 comments',
                    style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 95),
                    child: Row(
                      children: [
                          Icon(
                          Icons.watch_later_outlined,
                          color: Colors.black54,
                          size: 18,
                        ),
                         SizedBox(width: 5,),
                         Text(
                          '10:06 AM',
                          style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),

                    // child: IconButton(
                    //   icon: Icon(
                    //     Icons.share_outlined,
                    //     color: Colors.black,
                    //     size: 18,
                    //   ),
                    //   onPressed: () {},
                    // ),
                  ),
                ],
              ),
            ),
            Divider(
              color: Colors.grey,
              thickness: 1,
              height: 0,
            ),
            // Like, Comment, Share buttons
            Padding(
              padding: const EdgeInsets.only(left: 3),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // Love Button
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(
                            isLiked ? Icons.favorite : Icons.favorite_border,
                            color: isLiked ? Color(0xFFd63031) : Colors.black,
                            size: 18,
                          ),
                          onPressed: () {
                            setState(() {
                              isLiked = !isLiked; // Toggle like status
                            });
                          },
                        ),
                        Text(
                          'Like',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 5),
                    // Comment Button
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.comment_outlined,
                            color: Colors.black,
                            size: 18,
                          ),
                          onPressed: () {},
                        ),
                        Text(
                          'Comment',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(width: 80),

                    // Share
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Share.share('com.example.share_app'); // Pass the title to _onShare
                          },
                          child: Row(
                            children: [
                              Icon(
                                Icons.share_outlined,
                                color: Colors.black,
                                size: 18,
                              ),
                              SizedBox(width: 10,),
                              Text(
                                'Share',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    // Share Button



                  ],
                ),
              ),
            ),

            // Horizontal Gray Line at the Bottom
            Divider(
              color: Colors.grey,
              thickness: 3,
              height: 2,
            ),
          ],
        ),
      ),
    );
  }
}
